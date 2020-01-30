from django.test import TestCase, LiveServerTestCase, override_settings
from rest_framework.test import APIClient
from selenium.webdriver.common.keys import Keys

from census.models import Census
from base import mods
from base.tests import BaseTestCase
from django.test import Client
from django.urls import reverse

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
import time
import unittest


class CensusTestCase(BaseTestCase):

    def setUp(self):
        super().setUp()
        self.census = Census(voting_id=1, voter_id=1)
        self.census.save()

    def tearDown(self):
        super().tearDown()
        self.census = None

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

    def test_normal_distribution(self):
        self.assertEqual(self.census.normaldistribution(1000, 2.81, 0.8, 0.05), 336)
        self.assertEqual(self.census.normaldistribution(500, 2.575, 0.72, 0.1), 106)
        self.assertEqual(self.census.normaldistribution(1256, 1.96, 0.5, 0.15), 42)
        self.assertEqual(self.census.normaldistribution(2000, 1.2827, 0.75, 0.05), 117)
        self.assertEqual(self.census.normaldistribution(200, 2.81, 0.89, 0.09), 65)
        self.assertEqual(self.census.normaldistribution(333, 1.1505, 0.65, 0.01), 300)

    def test_normal_distribution_big_population(self):
        self.assertEqual(self.census.normaldistributionforbigpopulation(2.81, 0.72, 0.05), 637)
        self.assertEqual(self.census.normaldistributionforbigpopulation(2.30, 0.9, 0.08), 75)
        self.assertEqual(self.census.normaldistributionforbigpopulation(1.96, 0.85, 0.15), 22)
        self.assertEqual(self.census.normaldistributionforbigpopulation(2.81, 0.2, 0.01), 12634)
        self.assertEqual(self.census.normaldistributionforbigpopulation(2.575, 0.5, 0.03), 1842)
        self.assertEqual(self.census.normaldistributionforbigpopulation(1.4393, 0.65, 0.2), 12)

    def test_binomial_distribution(self):## NOTE: Se aconseja usar este método con poblaciones pequeñas. Los resultados devueltos están en tanto por 1, y definen la probabilidad que ocurra dicho evento.
        self.assertEqual(self.census.binomialdistribution(10, 2, 0.55), 0.0228895894)
        self.assertEqual(self.census.binomialdistribution(20, 15, 0.9), 0.1255824)
        self.assertEqual(self.census.binomialdistribution(40, 1, 0.1), 0.0065692813)
        self.assertEqual(self.census.binomialdistribution(35, 5, 0.3), 0.6585292006)
        self.assertEqual(self.census.binomialdistribution(26, 16, 0.85), 0.0221302766)
        self.assertEqual(self.census.binomialdistribution(45, 19, 0.7), 0.0303701485)

    def test_poisson_distribution(self):## NOTE: Se aconseja usar este método con poblaciones medianas.
        self.assertEqual(self.census.poissondistribution(500, 20, 0.04), 0.0888)
        self.assertEqual(self.census.poissondistribution(1000, 70, 0.1), 0.0003)
        self.assertEqual(self.census.poissondistribution(800, 15, 0.008), 0.0016)
        self.assertEqual(self.census.poissondistribution(100, 4, 0.01), 0.0153)
        self.assertEqual(self.census.poissondistribution(300, 3, 0.02), 0.0892)
        self.assertEqual(self.census.poissondistribution(400, 20, 0.02), 0.0002)

    def test_geometric_distribution(self):## NOTE: la tercera variable de este método representa el número de casos ocurridos hasta lograr el primero de los que buscamos.
        self.assertEqual(self.census.geometricdistribution(0.1, 20), 0.0135)
        self.assertEqual(self.census.geometricdistribution(0.9, 5), 0.0001)
        self.assertEqual(self.census.geometricdistribution(0.2, 2), 0.16)
        self.assertEqual(self.census.geometricdistribution(0.05, 30), 0.0113)
        self.assertEqual(self.census.geometricdistribution(0.09, 7), 0.0511)
        self.assertEqual(self.census.geometricdistribution(0.01, 10), 0.0091)

    def test_bernoulli_distribution(self):
        self.assertEqual(self.census.bernoullidistribution(3, 8), 0.375)
        self.assertEqual(self.census.bernoullidistribution(1, 6), 0.1667)
        self.assertEqual(self.census.bernoullidistribution(3, 15), 0.2)
        self.assertEqual(self.census.bernoullidistribution(13, 40), 0.325)
        self.assertEqual(self.census.bernoullidistribution(42, 139), 0.3022)
        self.assertEqual(self.census.bernoullidistribution(1, 69), 0.0145)

    def test_negative_binomial_distribution(self):# # NOTE: Se recomienda usar este método con muestras pequeñas, o submuestras representativas de la población que se estudia.
        self.assertEqual(self.census.negativebinomialdistribution(10, 3, 0.4), 0.0645)
        self.assertEqual(self.census.negativebinomialdistribution(5, 4, 7/11), 0.2385)
        self.assertEqual(self.census.negativebinomialdistribution(15, 10, 0.8), 0.0688)
        self.assertEqual(self.census.negativebinomialdistribution(9, 2, 0.3), 0.0593)
        self.assertEqual(self.census.negativebinomialdistribution(10, 2, 0.05), 0.0149)
        self.assertEqual(self.census.negativebinomialdistribution(25, 10, 0.2), 0.0047)         

@override_settings(ROOT_URLCONF='decide.decide.decide.urls')
class TestViewsCensus(TestCase):

    def setUp(self):
        super().setUp()
        self.census = Census(voting_id=1, voter_id=1)
        self.census.save()
        self.client=Client()

    def test_importar_censo(self):
        response= self.client.get('/census/census/importar/')
        self.assertEqual(response.status_code,200)
        self.assertContains(response,"Carga")

    def test_exportar_censo(self):
        response= self.client.get('/census/census/exportar/')
        self.assertEqual(response.status_code,200)
        self.assertContains(response,"Exportar Censo")

    def test_exportar_csv_censo(self):
        url = "/census/census/exportar/csv"
        response = self.client.get(url)
        self.assertContains(response,"1,1")

    def test_exportar_json_censo(self):
        url = "/census/census/exportar/json"
        response = self.client.get(url)
        self.assertContains(response,'"voting_id": 1, "voter_id": 1')
        self.assertNotContains(response,'"voting_id": 3, "voter_id": 2')

    def test_exportar_yaml_censo(self):
        url = "/census/census/exportar/yaml"
        response = self.client.get(url)
        self.assertContains(response,"voter_id: 1\n  voting_id: 1\n")

    def test_eliminar_censo(self):
        ids = Census.objects.all().values_list('id', flat=True)
        for id in ids:
            url= "/census/delete/"+ str(id)
            response = self.client.post(url)

        self.assertFalse(Census.objects.all().exists())


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
