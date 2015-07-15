# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0009_voted_voted_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='voted',
            name='voted_date',
            field=models.DateTimeField(verbose_name='date voted', default=datetime.datetime(2015, 7, 12, 16, 27, 0, 827826, tzinfo=utc)),
        ),
    ]
