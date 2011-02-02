#!/bin/bash

## Pivotal Tracker View my Work data via URL API
## Version: 0.75
## Author: Nathan McDaniel

API_KEY=$1
FILENAME=mywork.txt
USERNAME="$2"
TEMPFILE1=$RANDOM
TEMPFILE2=$RANDOM

## View my Work

#
# Name: cleanupXml()
# Parameters:
#		$1 = input file
#		$2 = output file
#
function cleanupXml() {
	grep -E 'url|name' $1 | sed -e "s/<url>/Url: /" | sed -e "s/<name>/Name: /" | sed -e "s/<\/url>//" | sed -e "s/<\/name>//" > $2
}

# 
# Name: viewMyWork()
# Parameters:
#		$1 = pivotal id
#		$2 = project name
#		$3 = user name
#
function viewMyWork() {
	#echo "Getting work for $2 ..."
	echo "My work ($3) for $2: " >> $FILENAME
	curl -k -H "X-TrackerToken: $API_KEY" -X GET "https://www.pivotaltracker.com/services/v3/projects/$1/stories?filter=mywork:$3" > $TEMPFILE1
	cleanupXml $TEMPFILE1 $TEMPFILE2
	cat $TEMPFILE2 >> $FILENAME
}


# Backup All Projects Information:
echo "" > $FILENAME


# View My Work:
# Backup Projects Data:
# Replace ###### with the numerical id of your pivotal project.
viewMyWork ###### "Some Project 1" "$USERNAME"
viewMyWork ###### "Some Project 2" "$USERNAME"
viewMyWork ###### "Some Project 3" "$USERNAME"
viewMyWork ###### "Some Project 4" "$USERNAME"


# Add URLs:
sed -E "s|http[s]?[:]//[^ ]*|<a href=\"&\">&</a>|g" $FILENAME > $TEMPFILE1
cp $TEMPFILE1 $FILENAME

# Print it out:
cat $FILENAME

# Cleanup
rm $TEMPFILE1
rm $TEMPFILE2
rm $FILENAME
