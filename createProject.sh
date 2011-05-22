#!/bin/sh

# Author 	: Alessandro Franzi
# Description 	: Create the directory and gives the starting configuration. It uses the ant file createProject.xml.
#		  ant -f createProject.xml -DprojectName=[prjname] 

ANT_FILE="createProject.xml"
PARAMETER_NAME="projectName"
EXPECTED_ARGS=1
E_BADARGS=65
E_ANTFAIL=66

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "AllStubs - Usage: sh `basename $0` {projectName}"
  exit $E_BADARGS
fi

pathcomp="$1"

if which ant > /dev/null
then 
	# Lancio lo script ant per la creazione del progetto
	ant -f $ANT_FILE -D$PARAMETER_NAME=$1 > /dev/null
	# recupero lo stato dell'esecuzione di ant
	antReturnCode=$?
	
	if [ $antReturnCode -ne 0 ];then

	    	echo "AllStubs - something doesn't works. You can find error message details reading on top...If you can't solve the problem please contact me at franziale@gmail.com.I will fix."
	    	exit $E_ANTFAIL;
	else
	 
	   	echo "AllStubs - the project $pathcomp has been created!" 
		echo "Remember to edit ./$pathcomp/endpoint.list file that contains web service references"
		echo "Remember to edit ./$pathcomp/project.conf file that contains project configurations"
	    	exit 0;
	fi		
else
echo "AllStubs - Please install at least ant 1.8"
fi
