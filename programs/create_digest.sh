#!/bin/bash
#
# create_digest.sh
#
# 	shell script that automates creation of notion econ paper database
# 
# arjun srinivasan
# april-may 2022

# create notion database, store info
python3 create_notion_db.py > database_info.txt

# get wp numbers to fetch
python3 get_new_wp_list.py

# fetch metadata on those papers
