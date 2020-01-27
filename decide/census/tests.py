from django.test import TestCase, LiveServerTestCase, override_settings
from rest_framework.test import APIClient
from selenium.webdriver.common.keys import Keys

from census.models import Census
from base import mods
from base.tests import BaseTestCase

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
import unittest


class CensusTestCase(TestCase):

    def setUp(self):
        super().setUp()
        self.census = Census(voting_id=1, voter_id=1)
        self.census.save()

    def tearDown(self):
        super().tearDown()
        self.census = None

"""

    def test_check_vote_permissions(self):
        response = self.client.get('/census/{}/?voter_id={}'.format(1, 2), format='json')
        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(), 'Invalid voter')

        response = self.client.get('/census/{}/?voter_id={}'.format(1, 1), format='json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), 'Valid voter')

    def test_list_voting(self):
        response = self.client.get('/census/?voting_id={}'.format(1), format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.get('/census/?voting_id={}'.format(1), format='json')
        self.assertEqual(response.status_code, 403)

        self.login()
        response = self.client.get('/census/?voting_id={}'.format(1), format='json')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {'voters': [1]})

    def test_add_new_voters_conflict(self):
        data = {'voting_id': 1, 'voters': [1]}
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 403)

        self.login()
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 409)

    def test_add_new_voters(self):
        data = {'voting_id': 2, 'voters': [1, 2, 3, 4]}
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 401)

        self.login(user='noadmin')
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 403)

        self.login()
        response = self.client.post('/census/', data, format='json')
        self.assertEqual(response.status_code, 201)
        self.assertEqual(len(data.get('voters')), Census.objects.count() - 1)

    def test_destroy_voter(self):
        data = {'voters': [1]}
        response = self.client.delete('/census/{}/'.format(1), data, format='json')
        self.assertEqual(response.status_code, 204)
        self.assertEqual(0, Census.objects.count())
"""
    def test_sampling_fraction(self):
        self.assertEqual(self.census.samplingfraction(28, 4), 14.2857)
        self.assertEqual(self.census.samplingfraction(500, 321), 64.2000)
        self.assertEqual(self.census.samplingfraction(30000, 11679), 38.9300)
        self.assertEqual(self.census.samplingfraction(500000, 245630), 49.1260)
        self.assertEqual(self.census.samplingfraction(1000, 41), 4.1000)
        self.assertEqual(self.census.samplingfraction(4500, 4500), 100.0000)

    def test_elevation_coefficient(self):
        self.assertEqual(self.census.elevationcoefficient(28, 4), 7.0000)
        self.assertEqual(self.census.elevationcoefficient(500, 321), 1.5576)
        self.assertEqual(self.census.elevationcoefficient(30000, 11679), 2.5687)
        self.assertEqual(self.census.elevationcoefficient(500000, 245630), 2.0356)
        self.assertEqual(self.census.elevationcoefficient(1000, 41), 24.3902)
        self.assertEqual(self.census.elevationcoefficient(4500, 4500), 1.0000)

"""
@override_settings(ROOT_URLCONF='decide.decide.decide.urls')
class AccountTestCase(LiveServerTestCase):
    fixtures = ['database.json']

    def setUp(self):
        self.selenium = webdriver.Chrome(ChromeDriverManager().install())
        super(AccountTestCase, self).setUp()

    def tearDown(self):
        self.selenium.quit()
        super(AccountTestCase, self).tearDown()

    def test_login(self):
        selenium = self.selenium
        selenium.get('%s%s' % (self.live_server_url, '/census/'))

        link = selenium.find_element_by_link_text('login')
        link.click()
        username = selenium.find_element_by_id('id_username')
        password = selenium.find_element_by_id('id_password')
        submit = selenium.find_element_by_id('submit')

        username.send_keys('jose')
        password.send_keys('Cc[7>2SM&R3zUvC7')
        submit.click()
        print('current url:')
        print(selenium.current_url)
        assert selenium.current_url == '%s%s' % (self.live_server_url, '/census/')

    def test_bad_login(self):
        selenium = self.selenium
        selenium.get('%s%s' % (self.live_server_url, '/census/'))
        link = selenium.find_element_by_link_text('login')
        link.click()
        username = selenium.find_element_by_id('id_username')
        password = selenium.find_element_by_id('id_password')

        submit = selenium.find_element_by_id('submit')

        username.send_keys('jose')
        password.send_keys('1234')
        submit.click()
        print('current url:')
        print(selenium.current_url)
        assert selenium.current_url != '%s%s' % (self.live_server_url, '/census/')

    def test_create_census(self):
        selenium = self.selenium
        selenium.get('%s%s' % (self.live_server_url, '/census/'))
        link = selenium.find_element_by_link_text('login')
        link.click()
        username = selenium.find_element_by_id('id_username')
        password = selenium.find_element_by_id('id_password')

        submit = selenium.find_element_by_id('submit')

        username.send_keys('jose')
        password.send_keys('Cc[7>2SM&R3zUvC7')
        submit.click()
        time.sleep(2)
        link_access = selenium.find_element_by_id('index')
        link_access.click()
        time.sleep(2)
        link_create = selenium.find_element_by_id('link_create')
        link_create.click()
        votante = selenium.find_element_by_name('votante')
        votacion = selenium.find_element_by_name('votacion')
        votante.click()
        time.sleep(2)
        votante.send_keys('1')
        votacion.click()
        votacion.send_keys('2')
        time.sleep(2)
        submit = selenium.find_element_by_id('submit')

        submit.click()
        time.sleep(2)
        print(selenium.current_url)
        assert selenium.current_url == '%s%s' % (self.live_server_url, '/census/census/')

    def test_bad_create_census(self):
        selenium = self.selenium
        selenium.get('%s%s' % (self.live_server_url, '/census/'))
        link = selenium.find_element_by_link_text('login')
        link.click()
        username = selenium.find_element_by_id('id_username')
        password = selenium.find_element_by_id('id_password')

        submit = selenium.find_element_by_id('submit')

        username.send_keys('jose')
        password.send_keys('Cc[7>2SM&R3zUvC7')
        submit.click()
        time.sleep(2)
        link_access = selenium.find_element_by_id('index')
        link_access.click()
        time.sleep(2)
        link_create = selenium.find_element_by_id('link_create')
        link_create.click()
        votante = selenium.find_element_by_name('votante')
        votacion = selenium.find_element_by_name('votacion')
        votante.click()
        time.sleep(2)
        votante.send_keys('1')
        votacion.click()
        votacion.send_keys('1')
        time.sleep(2)
        submit = selenium.find_element_by_id('submit')

        submit.click()
        time.sleep(2)
        print(selenium.current_url)
        assert selenium.current_url != '%s%s' % (self.live_server_url, '/census/census/')

    def test_delete_census(self):
        selenium = self.selenium
        selenium.get('%s%s' % (self.live_server_url, '/census/'))
        link = selenium.find_element_by_link_text('login')
        link.click()
        username = selenium.find_element_by_id('id_username')
        password = selenium.find_element_by_id('id_password')

        submit = selenium.find_element_by_id('submit')

        username.send_keys('jose')
        password.send_keys('Cc[7>2SM&R3zUvC7')
        submit.click()
        time.sleep(2)
        link_access = selenium.find_element_by_id('index')
        link_access.click()
        time.sleep(2)
        delete = selenium.find_element_by_id('elimina_1')
        delete.click()
        time.sleep(2)
        row_count = len(selenium.find_elements_by_xpath("//table[@id='DataTable']/tbody/tr"))
        assert row_count == 0
"""
