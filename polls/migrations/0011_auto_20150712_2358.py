# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0010_auto_20150712_2157'),
    ]

    operations = [
        migrations.AlterField(
            model_name='voted',
            name='voted_date',
            field=models.DateTimeField(default=datetime.datetime(2015, 7, 12, 18, 28, 39, 455780, tzinfo=utc), verbose_name='date voted'),
        ),
    ]
