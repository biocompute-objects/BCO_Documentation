#!/usr/bin/env python 
# -*- coding: utf-8 -*-

################################################################################
                        ##change_log.py##
"""change_log.py"""
################################################################################

import calendar
import datetime
import json
import os
import string
import re
import sys
from string import Template

release = '1.4.0'
 
year = datetime.date.today().year
month = "{:%B}".format(datetime.date.today())
day =  "{:%d}".format(datetime.date.today())

with open('./scripts/git-log.json', 'rU') as log_file:
    log = json.load(log_file)
with open('./scripts/git-stat.json', 'rU') as stat_file:
    stat = json.load(stat_file)
for i in log:
    if len(i['message']) < 1:
        i['message'] = 'NA'
    if i['commit'] in stat.keys():
        i['stats'] = stat[i['commit']]
        
# ['stats', u'author', u'date', u'commit', u'message', u'email', u'subject']
# [u'deletions', u'path', u'insertions']

PROJECT_DIRECTORY = os.path.join(os.path.dirname(__file__), os.pardir)

TEMPLATE_TOP = string.Template("""

BioCompute Object Specification Release Notes
===========================================================
## Release v ${release} ${month_name} ${year}

""")

TEMPLATE_CONTENTS = string.Template("""
------------------------------------------------------------
### Subject:    ${subject}

Commit Hash:     ${commit}

Author & Email:     ${author}   ${email}

Commit Date and Time:       ${date}

#### Message: 

    ${message}

Changes 
""")

TEMPLATE_STATS = string.Template("""

- FILE: ${path}

    Deletions   ${deletions}    Insirtions     ${insertions}

""")


contents = ''
for i in log:
    log_params = i
    contents += TEMPLATE_CONTENTS.safe_substitute(**log_params)
    for s in i['stats']:
        stats = ''
        stat_params = s
        stats += TEMPLATE_STATS.safe_substitute(**stat_params)
        contents += stats

TEMPLATE_BOTTOM = string.Template("""

============================================================

""")
template_params = dict(
    month_name=month,
    year=year,
    release=release
)
release_issue_contents = TEMPLATE_TOP.safe_substitute(**template_params)
release_issue_contents += contents
release_issue_contents += TEMPLATE_BOTTOM.safe_substitute(**template_params)

with open('docs/CHANGELOG.md', 'w') as change_log:
    change_log.write(release_issue_contents)