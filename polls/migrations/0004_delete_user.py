# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0003_user_user_name'),
    ]

    operations = [
        migrations.DeleteModel(
            name='User',
        ),
    ]
