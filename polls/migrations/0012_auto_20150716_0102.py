# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0011_auto_20150712_2358'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='category_color',
            field=models.CharField(default='#F44336', max_length=10),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='voted',
            name='voted_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 7, 15, 19, 29, 41, 313805, tzinfo=utc), verbose_name='date voted'),
        ),
    ]
