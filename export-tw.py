#!/usr/bin/python

import sys
import os
import json
import dateutil.parser
import time
from jinja2 import Environment, FileSystemLoader


##
# task end.after:today-1wk status:completed export | ./export-tw.py 
# task status:pending export | ./export-tw.py  
##
data = json.load(sys.stdin)

project_dict = {}
for dat in data:
    str_out = '{}\t{}'
    project = dat.get('project', 'misc')
    items = project_dict.get(project, [])
    items.append(dat)
    project_dict[project] = items


def parse_date(key, dat):
    if key in dat:
        dat[key] = dateutil.parser.parse(dat[key]).strftime('%Y-%m-%d')


for key, value in project_dict.items():
    for dat in value:
        parse_date('end', dat)
        parse_date('entry', dat)
        parse_date('modified', dat)
        if 'totalactivetime' in dat:
            total_time = dat['totalactivetime'].split('seconds')[0]
            dat['totalactivetime'] = time.strftime('PT%HH%MM%SS', time.gmtime(float(total_time)))


env = Environment(loader=FileSystemLoader(os.path.join('.', 'tw-templates')))
template = env.get_template('tw_out.j2')
print(template.render(projects=project_dict))
