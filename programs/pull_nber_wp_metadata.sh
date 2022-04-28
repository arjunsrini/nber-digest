#!/bin/bash
#
# pull_nber_wp_metadata.sh
#
# 	shell scripts that defines functions necessary to extract relevant working paper data
# 
# arjun srinivasan
# april-may 2022
# 



# get_paper_metadata
# 
# 	extract paper metadata from nber working paper page
#
# parameters:
# 	1 working paper number
# 	2 output file path
#
# returns:
# 	NA
#
# output:
# 	saves paper metadata to file path (arg 2)
#
get_paper_metadata () {

	# arguments
	local wpnum=$1
	local fp_out=$2

	# local variables
	local fp_tmp="./tmp.html"

	# fetch relevant page
	local url_base="https://www.nber.org/papers/w"
	local url="${url_base}${wpnum}"
	curl "${url}" -o $fp_tmp --silent

	# get the title, authors, date, doi, and article url
	awk '/dcterms.title/ { print $0 }
		/dcterms.creator/ { print $0 }
		/dcterms.date/ { print $0 }
		/citation_title/ { print $0 }
		/citation_author/ { print $0 }
		/citation_doi/ { print $0 }
		/citation_publication_date/ { print $0 }
		/citation_pdf_url/ { print $0 }' $fp_tmp | sed 's/^.*content=/ /' | tr -d '">//' | sed -r 's/^.{1}//' > $fp_out

	# get the abstract (2 lines after div element of class page-header__intro-inner)
	grep -A2 page-header__intro-inner $fp_tmp | tail -n 1 | sed 's/<br \/>//' >> $fp_out

	# clean up
	rm $fp_tmp

}



# get_range_of_papers
# 
# 	call get_paper_metadata on a range of papers
#
# parameters:
# 	1 lowest working paper number to collect
# 	2 highest working paper number to collect
# 	3 path to output directory
# 
# returns:
# 	NA
#
# output:
# 	saves paper metadata to file path (arg 2)
#
get_range_of_papers () {

	# arguments
	local wpnum_start=$1
	local wpnum_end=$2
	local dir_out=$3

	echo "Beginning data collection!"
	for i in $(seq $wpnum_start $wpnum_end)
	do
		echo "Fetching working paper no. $i..."
		get_paper_metadata $i "$dir_out/${i}.txt"
	done

}



# fetch_metadata_for_wp_list
# 
# 	given a list of nber working paper numbers, fetch metadata for each
#
# parameters:
# 	1 path to input
# 	2 path to output 
# 
# returns:
# 	NA
#
# output:
# 	saves paper metadata to file path (arg 2)
#
fetch_metadata_for_wp_list () {

	local wp_list=$1
	local dir_out=$2

	while read in; do
	    get_paper_metadata $in "$dir_out/${in}.txt"
	done < $wp_list

}



fetch_metadata_for_wp_list "./wp_nums.txt" "../data/docs"

# get_range_of_papers $wpnum_start $wpnum_end 
