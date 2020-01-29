# Generated by Django 2.0 on 2018-06-05 08:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('voting', '0002_auto_20180302_1100'),
    ]
    aux = django.db.models.deletion.SET_NULL
    operations = [
        migrations.AlterField(
            model_name='voting',
            name='auths',
            field=models.ManyToManyField(related_name='votings',
                                         to='base.Auth'),
        ),
        migrations.AlterField(
            model_name='voting',
            name='pub_key',
            field=models.OneToOneField(blank=True,
                                       null=True,
                                       on_delete=aux,
                                       related_name='voting', to='base.Key'),
        ),
    ]
