# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0012_auto_20150716_0102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='voted',
            name='voted_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 7, 20, 15, 45, 20, 518497, tzinfo=utc), verbose_name=b'date voted'),
        ),
    ]
