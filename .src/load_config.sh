#! /bin/bash 

parse_xml() {
    # Change the input filed separator from space,tab,/n to > 
    local IFS=\>
    # read from stdin and stop on < (split the catched input into two ) 
    read -d \< ENTITY CONTENT
}

while parse_xml; do
    if [[ -n "$(echo $CONTENT | tr -d '\n')" ]]; then 
	sed  -i '' "s/\($ENTITY\).*/\1}{$CONTENT}/" $1/mystyle.sty 
    fi
#To get double quotes ( using \\ in the shared configs will get replaced by will not be kept when using the sed inside the loop because of the double quotes, writing \\\\\\\\ ( replaced by \\\\ when parsing the file, then by \\ inside sed which means \ in the resulting file ) for each newline is cumbersome for the user. so i changed it by newl keyword to jump line. 
sed -i ''  's/newl/\\\\/g' $1/mystyle.sty

done < configs/shared_configs.xml 
