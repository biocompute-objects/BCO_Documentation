#!/usr/bin/env python
# -*- coding: utf-8 -*-

################################################################################
                            ##JSON ID, HIVE##
""""JSON conversion of text file from HIVE"""
################################################################################
import os, json
from json import JSONEncoder
from pprint import pprint

# class biocompute(dict):
#     def __init__(self,*arg,**kw):
#         super(biocompute, self).__init__(*arg, **kw)
#         self = {}
#         self['id'] = ""
#         self['name'] = ""
#         self['outputs'] = ['']
biocompute = {}

class MyEncoder(JSONEncoder):
    def default(self, o):
        return o.__dict__

in_file = "WXSwf1.json"
out_file = "/Users/hadleyking/Downloads/qaqclist.txt"

with open(in_file) as data_file:
    data = json.load(data_file)

biocompute['id'] = data['sbg:id']
biocompute['name'] = data['label']
biocompute['version'] = len(data['sbg:revisionsInfo'])
biocompute['digital_signature'] = ""
biocompute['verification_status'] = "unreviewed"
biocompute['publication_status'] = "draft"
biocompute['usability_domain'] = []
biocompute['authors'] = [{}],
biocompute['description_domain']={}
biocompute['description_domain']['xref'] = []
biocompute['description_domain']['keywords'] = []
biocompute['description_domain']['pipeline_steps'] ={}
biocompute['execution_domain']= {}
biocompute['execution_domain']['platform'] = 'sbg'
biocompute['execution_domain']['url'] = ''
biocompute['execution_domain']['pipeline_version'] = ''
biocompute['execution_domain']['env_parameters'] = ''
biocompute['execution_domain']['driver'] = ''
biocompute['execution_domain']['prerequisites'] = []
biocompute['parametric_domain'] = {}

biocompute['io_domain'] = {}
biocompute['io_domain']['reference_uri'] = []
biocompute['io_domain']['input_uri_list'] = []
for i in data['inputs']:
    biocompute['io_domain']['input_uri_list'] += [str(i['label'])]
biocompute['io_domain']['output_uri_list'] = []
for i in data['outputs']:
    for r in range(len(i['source'])):
        biocompute['io_domain']['output_uri_list'].append(str(i['source'][r]))
biocompute['error_domain'] = []

#setup for pipeline steps
for i in data['steps']:
    steps = {}
    steps[i['id']] = {}
    try: 
        steps[i['id']]['version'] = i['run']['sbg:toolkitVersion']
    except: 
        steps[i['id']]['version'] = 'null'
    steps[i['id']]['description'] = i['run']['description']
    for r in i['run']['requirements']:
        try: 
            steps[i['id']]['package'] += r['id']
        except: 
            steps[i['id']]['package'] = 'null'
    steps[i['id']]['input'] = []
    for p in i['inputs']:
        steps[i['id']]['input'].append(str(p['id']))
    steps[i['id']]['output'] = []
    for o in i['outputs']:
        steps[i['id']]['output'].append(str(o['id']))
    biocompute['description_domain']['pipeline_steps'] = steps[i['id']]
for i in biocompute['description_domain']['pipeline_steps']: print i, '\n'

print biocompute#['io_domain']['input_uri_list']


