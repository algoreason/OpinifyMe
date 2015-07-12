# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0005_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='category_id',
            field=models.ForeignKey(to='polls.Category', default='1001'),
        ),
    ]
