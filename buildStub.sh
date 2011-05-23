#!/bin/sh

# Author 	: Alessandro Franzi
# Description 	: Create Single stub or all projects stub. It calls the ant file script buildStub.xml
#		  [Single project] 	: ant -f buildStub.xml create -DprojectName=[prjname] 
#		  [All projects stub] 	: ant -f buildStub.xml 

ANT_FILE="buildStub.xml"
PARAMETER_NAME="projectName"
LOG_FOLDER="log"
LOG_FILENAME="buildStub.log"
EXPECTED_ARGS=1
E_BADARGS=65
E_ANTFAIL=66

command=""

echo "AllStubs - Execution time : `date`" > $LOG_FOLDER/$LOG_FILENAME

if which ant >> $LOG_FOLDER/$LOG_FILENAME
then 
	if [ $# -ne $EXPECTED_ARGS ]
	then
		# all stubs
		command="ant -f $ANT_FILE"
	else
		# single stub
		pathcomp="$1"
		command="ant -f $ANT_FILE -D$PARAMETER_NAME=$1"
	fi
	# Lancio lo script ant per la creazione del progetto
	echo "Generating stubs...please wait (command : $command)!"
	eval "$command 2>&1 >>  $LOG_FOLDER/$LOG_FILENAME"
	# recupero lo stato dell'esecuzione di ant
	antReturnCode=$?
	
	if [ $antReturnCode -ne 0 ];then

	    	echo "AllStubs - something doesn't works. You can find error message details reading on top...If you can't solve the problem please contact me at franziale@gmail.com.I will fix."
		echo "For more details please to read the log file : $LOG_FOLDER/$LOG_FILENAME"
	    	exit $E_ANTFAIL;
	else
	 
	   	echo "AllStubs - stubs has been created!" 
		echo "AllStubs - stubs has been created!" >> $LOG_FOLDER/$LOG_FILENAME
	    	exit 0;
	fi		
else
echo "AllStubs - Please install at least ant 1.8"
fi
