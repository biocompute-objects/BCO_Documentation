#!/usr/bin/env python
# -*- coding: utf-8 -*-

################################################################################
                            ##JSON Conversion##
""""JSON conversion of text file"""
################################################################################
import os

in_file = "/Users/hadleyking/GitHub/HTS-CSRS/biocompute_line_type.txt"
out_file = "/Users/hadleyking/Downloads/biocompute_line_type.json"

writer = open(out_file, 'w')
with open(in_file, 'r') as file:
    reader = file.read()
    reader = reader.split('#')
    reader1 = reader[0].split('\n')
    writer.write('{'+'\n')
    lists = []
    for line in reader1:
        if ':' not in line or line.startswith('Descriptions'): continue
        else: 
            line = line.split(':')
            line1 = line[1].strip()
            line0 = line[0].replace("'", '')
            lists.append('    "'+line0+'": '+' "'+line1+'"')
    for i in lists:
        j = str(i+'\n')
        if i == lists[-1]:
            writer.write(j)
        else: 
            j=j.strip()
            writer.write(j+','+'\n')
    writer.write('}'+'\n'+'\n')
    for section in reader[1:]:
        lineCount = 0
        writer.write('{'+'\n')
        lists = []
        reader2 = section.split('\n')
        for line in reader2:
            if line == reader2[0]:
                lineDes = line.strip()
                lineTyp = lineDes.replace(' ', '_')
                if lineDes.split(' ')[-1] == "TYPE":
                    lists.append('    "type":'+' "'+lineTyp+'",')
                if lineDes.split(' ')[-1] == "INSTANCE":
                    lists.append('    "instance":'+' "'+lineTyp+'",')

            if line.startswith('- '):
                lineDes = line[1:].strip()
                lists.append('    "description":'+' "'+lineDes+'",')
                lists.append('    "field_description": [')

            elif line[0:4] == 'line':
                if lineCount != 0: 
                    lists.append("        },")
                lineDes = line[6:].rstrip()
                lists.append('        {')
                lists.append('            "line": '+'"'+lineDes+'",')
                lineCount += 1

            elif line[0:4] == 'name':
                lineDes = line[6:].rstrip()
                lists.append('            "name": '+'"'+lineDes+'",')
                
            elif line[0:4] == 'note':
                lineDes = line[6:].rstrip()
                lists.append('            "note": '+'"'+lineDes+'"')


            else: continue
        lists.append('        }\n    ]')
        lists.append('}'+'\n')
        for i in lists:
            j = str(i+'\n')
            writer.write(j)