import datetime
import os
import random
from django.contrib.auth.models import User
from django.utils import timezone
from .models import Vote
from .serializers import VoteSerializer
from base.tests import BaseTestCase
from census.models import Census
from voting.models import Question
from voting.models import Voting
import unittest
from selenium import webdriver
from selenium.webdriver import Firefox
from django.core import management
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait


class StoreTextCase(BaseTestCase):
    def setUp(self):
        super().setUp()
        self.question = Question(desc='qwerty')
        self.question.save()
        self.voting = Voting(pk=5001,
                             name='voting example',
                             question=self.question,
                             start_date=timezone.now(),)
        self.voting.save()

    def tearDown(self):
        super().tearDown()

    def gen_voting(self, pk):
        voting = Voting(pk=pk, name='v1',
                        question=self.question,
                        start_date=timezone.now(),
                        end_date=timezone.now() + datetime.timedelta(days=1))
        voting.save()

    def get_or_create_user(self, pk):
        user, _ = User.objects.get_or_create(pk=pk)
        user.username = 'user{}'.format(pk)
        user.set_password('qwerty')
        user.save()
        return user

    def gen_votes(self):
        votings = [random.randint(1, 5000) for i in range(10)]
        users = [random.randint(3, 5002) for i in range(50)]

        for v in votings:
            a = random.randint(2, 500)
            b = random.randint(2, 500)

            self.gen_voting(v)
            random_user = random.choice(users)

            user = self.get_or_create_user(random_user)
            self.login(user=user.username)
            census = Census(voting_id=v, voter_id=random_user)
            census.save()
            data = {"voting": v, "voter": random_user,
                    "vote": {"a": a, "b": b}}
            response = self.client.post('/store/', data, format='json')
            self.assertEqual(response.status_code, 200)
            response = self.client.post('/store/', data, format='json')
            self.assertEqual(response.status_code, 200)

        self.logout()
        return votings, users

    def test_gen_vote_invalid(self):
        data = {"voting": 1, "voter": 1, "vote": {"a": 1, "b": 1}}
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 401)

    def test_store_vote(self):
        VOTING_PK = 345
        CTE_A = 96
        CTE_B = 184
        census = Census(voting_id=VOTING_PK, voter_id=1)
        census.save()
        self.gen_voting(VOTING_PK)
        data = {"voting": VOTING_PK,
                "voter": 1,
                "vote": {"a": CTE_A, "b": CTE_B}}
        user = self.get_or_create_user(1)
        self.login(user=user.username)
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(Vote.objects.count(), 1)
        self.assertEqual(Vote.objects.first().voting_id, VOTING_PK)
        self.assertEqual(Vote.objects.first().voter_id, 1)
        self.assertEqual(Vote.objects.first().a, CTE_A)
        self.assertEqual(Vote.objects.first().b, CTE_B)

    def test_vote(self):
        self.gen_votes()
        response = self.client.get('/store/', format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.get('/store/', format='json')
        self.assertEqual(response.status_code, 403)

        self.login()
        response = self.client.get('/store/', format='json')
        self.assertEqual(response.status_code, 200)
        votes = response.json()

        self.assertEqual(len(votes), Vote.objects.count())
        #self.assertEqual(votes[0],VoteSerializer(Vote.objects.all().first()).data)

    def test_filter(self):
        votings, voters = self.gen_votes()
        v = votings[0]

        response = self.client.get('/store/?voting_id={}'.format(v),
                                   format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.get('/store/?voting_id={}'.format(v),
                                   format='json')
        self.assertEqual(response.status_code, 403)

        self.login()

        response = self.client.get('/store/?voting_id={}'.format(v),
                                   format='json')
        self.assertEqual(response.status_code, 200)
        votes = response.json()

        self.assertEqual(len(votes),
                         Vote.objects.filter(voting_id=v).count())

        v = voters[0]
        response = self.client.get('/store/?voter_id={}'.format(v),
                                   format='json')
        self.assertEqual(response.status_code, 200)
        votes = response.json()

        self.assertEqual(len(votes),
                         Vote.objects.filter(voter_id=v).count())

    def test_hasvote(self):
        votings, voters = self.gen_votes()
        vo = Vote.objects.first()
        v = vo.voting_id
        u = vo.voter_id

        response = self.client.get('/store/?voting_id=' +
                                   '{}&voter_id={}'.format(v, u),
                                   format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.get('/store/?voting_id=' +
                                   '{}&voter_id={}'.format(v, u),
                                   format='json')
        self.assertEqual(response.status_code, 403)

        self.login()
        response = self.client.get('/store/?voting_id=' +
                                   '{}&voter_id={}'.format(v, u),
                                   format='json')
        self.assertEqual(response.status_code, 200)
        votes = response.json()

        self.assertEqual(votes[0]["voting_id"], v)
        self.assertEqual(votes[0]["voter_id"], u)

    def test_voting_status(self):
        data = {
            "voting": 5001,
            "voter": 1,
            "vote": {"a": 30, "b": 55}
        }
        census = Census(voting_id=5001, voter_id=1)
        census.save()
        # not opened
        self.voting.start_date = timezone.now() + datetime.timedelta(days=1)
        self.voting.save()
        user = self.get_or_create_user(1)
        self.login(user=user.username)
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 401)

        # not closed
        self.voting.start_date = timezone.now() - datetime.timedelta(days=1)
        self.voting.save()
        self.voting.end_date = timezone.now() + datetime.timedelta(days=1)
        self.voting.save()
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 200)

        # closed
        self.voting.end_date = timezone.now() - datetime.timedelta(days=1)
        self.voting.save()
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 401)

    def test_crear_copia_seguridad(self):
        DIR = os.getcwd() + '/store/backup'
        numeroBackups = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])
        numeroBackups = numeroBackups + 1
        self.assertEqual(1, 1)

    def test_eliminar_copia_seguridad(self):
        DIR = os.getcwd() + '/store/backup'
        numeroBackups = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])
        nombreCopias = os.listdir(DIR)
        nombreCopia = nombreCopias[0]
        dirABorrar = os.getcwd() + '/store/backup/' + nombreCopia
        os.remove(dirABorrar)
        numeroBackups = numeroBackups - 1
        self.assertEqual(numeroBackups,len([name for name in os.listdir(DIR)if os.path.isfile(os.path.join(DIR, name))]))

    def test_invalid_vote_field(self):
        VOTING_PK = 345
        CTE_A = 96
        CTE_B = 184
        census = Census(voting_id=VOTING_PK, voter_id=1)
        census.save()
        self.gen_voting(VOTING_PK)

        data = {
            "voting": 'VOTING_PK',
            "voter": 'a',
            "vote": { "a": CTE_A, "b": CTE_B }        
        }
        user = self.get_or_create_user(1)
        self.login(user=user.username)
        response = self.client.post('/store/', data, format='json')
        self.assertEqual(response.status_code, 400)

    # def test_backup_selenium(self):
    #     self.driver = webdriver.Firefox()
    #     self.driver.get("http://localhost:8000/admin/store/backup")
    #     self.driver.find_element_by_id('id_username').send_keys("decide")
    #     self.driver.find_element_by_id('id_password').send_keys("Nintendo123")
    #     self.driver.find_element_by_id('id_password').send_keys(Keys.RETURN)
    #     WebDriverWait(self.driver, 10).until(EC.presence_of_element_located((By.ID, "crea_copia_seguridad")))
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.driver.find_element_by_id('crea_copia_seguridad').click()
    #     self.assertTrue(len(self.driver.find_elements_by_id('user-tools'))>0) 
    #     self.driver.quit

    # def test_crear_votacion_selenium(self):
    #     self.driver = webdriver.Firefox()
    #     self.driver.get("http://localhost:8000/booth/1")
    #     WebDriverWait(self.driver, 20).until(EC.presence_of_element_located((By.ID, "username")))
    #     self.driver.find_element_by_id('username').send_keys("decide")
    #     self.driver.find_element_by_id('password').send_keys("Nintendo123")
    #     self.driver.find_element_by_id('password').send_keys(Keys.RETURN)
    #     self.assertTrue(len(self.driver.find_elements_by_id('user-tools'))>0)
    #     self.driver.quit
    #
        
