#!/bin/bash
#
# create_notion_db.sh
#
# 	shell scripts that posts the creation of a notion database
# 
# arjun srinivasan
# april-may 2022
# 
# template curl from: https://developers.notion.com/reference/create-a-database

# this command currently does not work!
curl --location --request POST 'https://api.notion.com/v1/databases/' \
--header 'Authorization: Bearer '"$NOTION_API_KEY"'' \
--header 'Content-Type: application/json' \
--header 'Notion-Version: 2022-02-22' \
--data '{
    "parent": {
        "type": "page_id",
        "page_id": '"$NOTION_PARENT_PAGE_ID"'
    },
    "icon": {
    	"type": "emoji",
			"emoji": "📄"
  	},
  	"cover": {
  		"type": "external",
    	"external": {
    		"url": "https://wallpapercave.com/wp/wp6957547.jpg"
    	}
  	},
    "title": [
        {
            "type": "text",
            "text": {
                "content": "NBBER Digest Database 1",
                "link": null
            }
        }
    ],
    "properties": {
        "Title": {
            "title": {}
        },
        "Working Paper Number": {
            "number": {}
        },
        "Authors": {
            "rich_text": {}
        },
        "Abstract": {
            "rich_text": {}
        },
        "Date Posted": {
            "date": {}
        },
        "DOI": {
            "rich_text": {}
        },
        "PDF url": {
            "url": {}
        }, 
        "Read": {
            "checkbox": {}
        }
    }
}'


