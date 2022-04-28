# from: https://developers.notion.com/reference/create-a-database
# how to get page id: https://developers.notion.com/docs/working-with-page-content#:~:text=Where%20can%20I%20find%20my%20page%27s%20ID%3F
import requests
from decouple import config         # see https://pypi.org/project/python-decouple/#env-file

url = "https://api.notion.com/v1/databases"

# fetch NOTION_PAGE_ID and NOTION_API_KEY from .env
NOTION_API_KEY = config('NOTION_API_KEY')
NOTION_PARENT_PAGE_ID = config('NOTION_PARENT_PAGE_ID')

payload = {
    "parent": {
        "type": "page_id",
        "page_id": "{}".format(NOTION_PARENT_PAGE_ID)
    },
    "title": [
        {
            "type": "text",
            "text": {
                "content": "NBER Digest Database",
                "link": None
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
}

headers = {
    "Accept": "application/json",
    "Notion-Version": "2022-02-22",
    "Content-Type": "application/json",
    "Authorization": "Bearer {}".format(NOTION_API_KEY)
}

response = requests.post(url, json=payload, headers=headers)

print(response.text)