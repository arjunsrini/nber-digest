# nber-digest

a *custom* nber digest. notion page that fetches/stores/creates a feed of relevant nber working paper abstracts

### setup

1. clone this repo
2. set up a [Notion integration](https://developers.notion.com/docs/getting-started).
	- keep your secret token in a secure place!
3. create a notion page that will hold your database page inside it. get the [page id](https://developers.notion.com/docs/working-with-page-content#:~:text=Where%20can%20I%20find%20my%20page%27s%20ID%3F) using info from the end of the url.
4. set environment variables `NOTION_PARENT_PAGE_ID` and `NOTION_API_KEY` appropriately in `.env` file in root of your copy of this repo
5. explore the [nber topics](https://www.nber.org/research/topics) and place a list of urls of topics you'd like to see in the file called `nber_topics.txt`. the default list includes new papers about [COVID](https://www.nber.org/topics/covid-19?page=1&perPage=50), [Unemployment and Immigration](https://www.nber.org/themes/immigration/immigrationsummary.shtml?page=1&perPage=50), [Education](https://www.nber.org/taxonomy/term/556?page=1&perPage=50), [Poverty and Wellbeing](https://www.nber.org/taxonomy/term/561?page=1&perPage=50), and [Labor discrimination](https://www.nber.org/taxonomy/term/596?page=1&perPage=50). add/remove any nber topic urls you are interested in seeing/not seeing. the urls should go to pages that look like this:

<p align="center">
<img src="https://i.imgur.com/UJ9laf0.png" width="200" height="500" />
</p>

6. run `create_digest.sh`, which creates a notion database with articles from your topics. this script:

- runs `create_notion_db.py` to create the notion database with appropriate fields
- runs `get_new_wp_list.py` to fetch a list of new wps in your chosen topics
- runs `pull_nber_wp_metadata.sh` which pull working paper metadata (authors, abstract, date, doi, url) for each wp

still working on posting those documents to the notion database

- runs `post_docs_to_db.sh` to post new document metadata to database

### todo

- routinely run `pull_nber_wps.sh` to update your notion database. maybe we could automate somehow? cronjob?
- programmatic sorting / creation of convenient views of notion database

