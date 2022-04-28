# nber-digest

notion page that fetches/stores/creates a feed of relevant nber working paper abstracts

### setup

1. clone this repo
2. set up a [Notion integration](https://developers.notion.com/docs/getting-started).
	- keep your secret token in a secure place!
3. create a notion page that will hold your database page inside it. extract [page id](https://developers.notion.com/docs/working-with-page-content#:~:text=Where%20can%20I%20find%20my%20page%27s%20ID%3F) using info from the end of the url.

not done yet

4. set environment variables `NOTION_PAGE_ID` and `NOTION_API_KEY` appropriately in `TODO.env` 
5. run `create_notion_db.py`
6. set preferences on which feeds of NBER recent working papers you want (will do as environment variable?)
7. run `pull_nber_wps.sh` which should populate/update the notion database 

usage

routinely run `pull_nber_wps.sh` to update your notion database. maybe we could automate somehow? cronjob?
