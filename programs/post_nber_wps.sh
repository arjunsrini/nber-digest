#!/bin/bash
#
# post_nber_wps.sh
#
# 	shell scripts that defines functions necessary to post working paper data to a notion database
# 
# arjun srinivasan
# april-may 2022
# 

# this dosn't work yet / probably will change to python

# create_notion_db
# 
# 	create notion database of working papers
#
# parameters:
#
# returns:
# 	NA
#
# output:
#
#
get_paper_metadata () {

	curl --location --request POST 'https://api.notion.com/v1/databases/' \
	--header 'Authorization: Bearer '"$NOTION_API_KEY"'' \
	--header 'Content-Type: application/json' \
	--header 'Notion-Version: 2022-02-22' \
	--data '{
	    "parent": {
	        "type": "page_id",
	        "page_id": "98ad959b-2b6a-4774-80ee-00246fb0ea9b"
	    },
	    "icon": {
	    	"type": "emoji",
				"emoji": "📄"
	  	},
	  	"cover": {
	  		"type": "external",
	    	"external": {
	    		"url": "https://website.domain/images/image.png"
	    	}
	  	},
	    "title": [
	        {
	            "type": "text",
	            "text": {
	                "content": "Grocery List",
	                "link": null
	            }
	        }
	    ],
	    "properties": {
	        "Name": {
	            "title": {}
	        },
	        "Description": {
	            "rich_text": {}
	        },
	        "In stock": {
	            "checkbox": {}
	        },
	        "Food group": {
	            "select": {
	                "options": [
	                    {
	                        "name": "🥦Vegetable",
	                        "color": "green"
	                    },
	                    {
	                        "name": "🍎Fruit",
	                        "color": "red"
	                    },
	                    {
	                        "name": "💪Protein",
	                        "color": "yellow"
	                    }
	                ]
	            }
	        },
	        "Price": {
	            "number": {
	                "format": "dollar"
	            }
	        },
	        "Last ordered": {
	            "date": {}
	        },
	        "Meals": {
	          "relation": {
	            "database_id": "668d797c-76fa-4934-9b05-ad288df2d136"
	          }
	    		},
	        "Number of meals": {
	          "rollup": {
	            "rollup_property_name": "Name",
	            "relation_property_name": "Meals",
	            "function": "count"
	          }
	        },
	        "Store availability": {
	            "type": "multi_select",
	            "multi_select": {
	                "options": [
	                    {
	                        "name": "Duc Loi Market",
	                        "color": "blue"
	                    },
	                    {
	                        "name": "Rainbow Grocery",
	                        "color": "gray"
	                    },
	                    {
	                        "name": "Nijiya Market",
	                        "color": "purple"
	                    },
	                    {
	                        "name": "Gus'\''s Community Market",
	                        "color": "yellow"
	                    }
	                ]
	            }
	        },
	        "+1": {
	            "people": {}
	        },
	        "Photo": {
	            "files": {}
	        }
	    }
	}'

}