from django.db import models
import math


class Census(models.Model):
    voting_id = models.PositiveIntegerField()
    voter_id = models.PositiveIntegerField()

    def samplingfraction(self, census, voters):
        res = float((voters/census)*100)

        if census != 0:
            res = round(res, 4)
        else:
            res = 0

        return float(res)

    def elevationcoefficient(self, census, voters):
        res = float(census/voters)

        if voters != 0:
            res = round(res, 4)
        else:
            res = 0

        return float(res)

    def normaldistribution(self, census, z, percentage, error):
        res = 0

        if census != 0 and percentage != 0 and error != 0 and z != 0:
            a = ((z*z) * percentage * (1-percentage) * census)
            b = ((census - 1) * (error*error)) + ((z*z) * percentage * (1-percentage))

            res = float(a/b)

            res = round(res, 4)
        else:
            res = -1

        return math.ceil(res)

    def normaldistributionforbigpopulation(self, z, percentage, error):
        res = 0

        if z != 0 and percentage != 0 and error != 0:
            a = ((z*z) * percentage * (1-percentage))

            res = float(a/(error*error))

            res = round(res, 4)
        else:
            res = -1

        return math.ceil(res)


    class Meta:
        unique_together = (('voting_id', 'voter_id'),)
        app_label = 'census'
