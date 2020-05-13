rm -r ./hot-folder
mkdir ./hot-folder

mysearch=$1

#cheak if the script get a word to search
#if not exit
if [ -z  "$mysearch" ]; then
	echo "missing a word to search" && exit 1
fi

# seacrh the word in all the files in this path
# copy all the files that has this word in them
# put the copy files in a new hot-folder 
for i in $(find . -type d);
do
	if [ "$i" != "./hot-folder" ]; then
		echo "This is the folder: $i"
		for myfile in $i/*;
		do
			if [  -f "$myfile" ];then
				echo "The file inside is: $myfile"
				name=$(basename "$myfile")
				if [ "$name" != "rec.sh" ];then
					check=$(grep -ni $mysearch "$myfile")
					if [ -z "$check" ];then
						echo "EMPTY"
					else
						echo "FOUND"
						name_f=$(basename "$myfile")
						cp "$myfile" ./hot-folder/"$name_f"
						echo "    " >> hot-folder/"$name_f"
						echo "****" >> hot-folder/"$name_f"
						echo "$check">> hot-folder/"$name_f"
					fi
				else
					echo "dont check"
				fi
			fi
		done
	
	echo "-------------------"
	echo""
	fi
done