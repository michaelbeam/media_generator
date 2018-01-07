#!/bin/bash

function usage {
	echo "Usage: $0 MEDIAPATH" >&2
}

# check for the target directory
if [[ $# -eq 0 ]]; then
	usage 
	exit
fi

cat << _header_
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Movies</title>
<link rel="icon" href="/favicon.png" type="image/png">
</head>
<body>
_header_

path=$1
cd $path
ls | while read a; do
	echo '<a href="'$path/$a'"><img src="'$path/$a'/title.png" width="400" height="230" /></a>'
	
	ls $a | while read b; do
		echo '<a href="'$path/$a/$b'">'$b'</a>'
	done
	
	echo "<br />"
done

cat << _footer_
</body>
</html>
_footer_
