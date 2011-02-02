Description: Pivotal Tracker API script to retrieve all of the work
	assigned to a particular user.

Notes:
	1) To configure, you must add your API key to the index.php (or pass
	it as a command-line to the bash script, and add the calls and 
	project ids to the bash script itself (see line 47 of
	pivotalviewmywork.sh).

	2) The php script requires "exec" privileges. This is a webserver
	configuration issues. Look up safe mode / etc.

Todo: Dynamically grab all of the projects associated with an account / 
	login credentials using the API rather than having to know about
	them in advance. Shouldn't be difficult.
