# from: https://developers.notion.com/reference/create-a-database
# how to get page id: https://developers.notion.com/docs/working-with-page-content#:~:text=Where%20can%20I%20find%20my%20page%27s%20ID%3F
import requests

url = "https://api.notion.com/v1/databases"

# this code will need to be modified to get NOTION_PAGE_ID and NOTION_API_KEY
# but it works otherwise!

payload = {
    "parent": {
        "type": "page_id",
        "page_id": "{}".format(NOTION_PAGE_ID)
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