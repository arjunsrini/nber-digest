from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By

#from selenium.webdriver.chrome.options import Options
#options = Options();
#options.add_argument("--log-level=3");
#chrome_options=options

# start driver
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

def get_wp_list(url):

	# open url, wait 1 sec to load
	driver.get(url)
	driver.implicitly_wait(1)

	# get wp number elements
	wp_number_elements = driver.find_elements(by=By.CLASS_NAME, value="paper-card__paper_number")
	wp_numbers = [elm.text for elm in wp_number_elements]

	# working paper numbers on this page
	return wp_numbers

def get_all_new_wp_numbers():

	# create set of new wp numbers
	new_wps = set()

	# open nber topics text file
	with open('../nber_topics.txt') as topics_file:

		# for each url (line) in the file
	    for topic_url in topics_file:

	    	#print("Fetching working paper numbers for topic url: {}".format(topic_url))
	    	new_wps_in_topic = get_wp_list(topic_url)

	    	#print("Working papers in this topic: {}".format(new_wps_in_topic))
	    	new_wps.update(new_wps_in_topic)

	# quit selenium chrome driver
	driver.quit()

	# return new 
	return new_wps

if __name__ == '__main__':

    # Execute when the module is not initialized from an import statement.
    new_wps = get_all_new_wp_numbers()

    # output file
    fp_out = "./wp_nums.txt"

    # Write lines to output file
    with open(fp_out, mode='wt', encoding='utf-8') as file:
    	file.write('\n'.join(new_wps))

