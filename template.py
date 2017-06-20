#!/usr/bin/env python
# -*- coding: utf-8 -*-

################################################################################
                            ##BCO temp##
""""..."""
################################################################################
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