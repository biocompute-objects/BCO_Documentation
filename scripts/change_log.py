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
import argparse

PROJECT_DIRECTORY = os.path.join(os.path.dirname(__file__), os.pardir)

TEMPLATE_TOP = Template("""

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

TEMPLATE_STATS = Template("""

- FILE: ${path}

    Deletions   ${deletions}    Insirtions     ${insertions}

""")


TEMPLATE_BOTTOM = Template("""

============================================================

""")
#______________________________________________________________________________#
def create_arg_parser():
    """"
    Creates and returns the ArgumentParser object.
    """

    parser = argparse.ArgumentParser(description='Parses git log output object for change-log generation.')

    parser.add_argument('-b', '--branch', default='dev',
                    help='current git branch checked out')

    return parser
#______________________________________________________________________________#
def load_logs():
    """
    
    """

    with open('./scripts/git-log.json', 'rU') as log_file:
        log = json.load(log_file)
    with open('./scripts/git-stat.json', 'rU') as stat_file:
        stat = json.load(stat_file)
    for i in log:
        if len(i['message']) < 1:
            i['message'] = 'NA'
        if i['commit'] in stat.keys():
            i['stats'] = stat[i['commit']]
    return log
#______________________________________________________________________________#
def release_contents( release, log ):
    """
    """

    template_params = dict(
        month_name="{:%B}".format(datetime.date.today()),
        year=datetime.date.today().year,
        day="{:%d}".format(datetime.date.today()),
        release=release
    )

    contents = ''
    for i in log:
        log_params = i
        contents += TEMPLATE_CONTENTS.safe_substitute(**log_params)
        for s in i['stats']:
            stats = ''
            stat_params = s
            stats += TEMPLATE_STATS.safe_substitute(**stat_params)
            contents += stats

    return template_params, contents
#______________________________________________________________________________#
def main( ):
    arg_parser = create_arg_parser()
    parsed_args = arg_parser.parse_args(sys.argv[1:])
    log = load_logs()
    template_params, contents = release_contents(parsed_args.branch, log)
    release_issue_contents = TEMPLATE_TOP.safe_substitute(**template_params)
    release_issue_contents += contents
    release_issue_contents += TEMPLATE_BOTTOM.safe_substitute(**template_params)

    with open('docs/CHANGELOG.md', 'w') as change_log:
        change_log.write(release_issue_contents)
    
#______________________________________________________________________________#
if __name__ == "__main__":
    main()