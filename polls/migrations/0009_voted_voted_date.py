# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0008_voted_choice'),
    ]

    operations = [
        migrations.AddField(
            model_name='voted',
            name='voted_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 7, 5, 7, 38, 5, 30640, tzinfo=utc), verbose_name='date voted'),
        ),
    ]
