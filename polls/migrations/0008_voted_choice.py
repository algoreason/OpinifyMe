# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0007_voted'),
    ]

    operations = [
        migrations.AddField(
            model_name='voted',
            name='choice',
            field=models.ForeignKey(to='polls.Choice', default='101'),
        ),
    ]
