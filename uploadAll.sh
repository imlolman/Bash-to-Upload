#!/bin/bash

echo -n "Do You Want to Upload All Files in Current Directory? (1/0): "
read a
if [ $a -eq 1 ]
then
	e="echo echo"
	filecontent=$e' "Copying All Files From Server ..."'
	for filename in *; do
		if [ $filename != "uploadAll.sh"  ]
		then
			temp=$(curl -F "file=@$filename" https://file.io | cut -b 24-29)
			filecontent=$filecontent"\ncurl https://file.io/"$temp" > "$filename
		fi
	done
	filecontent=$filecontent."\necho"' "Copied All Files ... Done. Thank to Satyam #lolman"'
	filecontent=$filecontent."\nrm download.sh"
	$filecontent > allFiles.sh
	temp=$(curl -F "file=@allFiles.sh" https://file.io | cut -b 24-29)
	echo ""
	echo "All Files in Current Directory are Uploaded, Your Key is "$temp
	echo ""
	echo "You Can Download the files by the following commands: "
	echo ""
	echo "---------------------------------------------------------"
	echo "curl https://file.io/"$temp" > download.sh"
	echo "chmod 777 download.sh"
	echo "sh download.sh"
	echo "---------------------------------------------------------"
	echo "Thanks For Using Our Tool"

fi
