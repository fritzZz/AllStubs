#!/bin/sh

# Author 	: Alessandro Franzi
# Description 	: Create the directory and gives the starting configuration. It uses the ant file createProject.xml.
#		  ant -f createProject.xml -DprojectName=[prjname] 

ANT_FILE="createProject.xml"
PARAMETER_NAME="projectName"
LOG_FOLDER="log"
LOG_FILENAME="createProject.log"
EXPECTED_ARGS=1
E_BADARGS=65
E_ANTFAIL=66

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "AllStubs - Usage: sh `basename $0` {projectName}"
  exit $E_BADARGS
fi

pathcomp="$1"

echo "AllStubs - Execution time : `date`" > $LOG_FOLDER/$LOG_FILENAME

if which ant >> $LOG_FOLDER/$LOG_FILENAME
then 
	# Creo la cartelle LOG_FOLDER
	mkdir $LOG_FOLDER > /dev/null
	# Lancio lo script ant per la creazione del progetto
	ant -f $ANT_FILE -D$PARAMETER_NAME=$1 2>&1 >>  $LOG_FOLDER/$LOG_FILENAME
	# recupero lo stato dell'esecuzione di ant
	antReturnCode=$?
	
	if [ $antReturnCode -ne 0 ];then

	    	echo "AllStubs - something doesn't works. You can find error message details reading on top...If you can't solve the problem please contact me at franziale@gmail.com.I will fix."
		echo "For more details please to read the log file : $LOG_FOLDER/$LOG_FILENAME"
	    	exit $E_ANTFAIL;
	else
	 
	   	echo "AllStubs - the project $pathcomp has been created!" 
		echo "AllStubs - the project $pathcomp has been created!" >> $LOG_FOLDER/$LOG_FILENAME
		echo "Remember to edit ./$pathcomp/endpoint.list file that contains web service references"
		echo "Remember to edit ./$pathcomp/project.conf file that contains project configurations"
	    	exit 0;
	fi		
else
echo "AllStubs - Please install at least ant 1.8"
fi
