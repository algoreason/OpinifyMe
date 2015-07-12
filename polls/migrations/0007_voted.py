# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('polls', '0006_question_category_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='Voted',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('question_id', models.ForeignKey(default='101', to='polls.Question')),
                ('username', models.ForeignKey(default='101', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
