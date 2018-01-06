#!/bin/bash

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

ls $1 | while read $a; do
	mdir="$1/$a"
	echo '<a href="'$mdir'"><img src="'$mdir'/title.png" width="400" height="230" /></a>'
	
	ls $mdir | while read b; do
		echo '<a href="'$mdir/$b'">'$b'</a>'
	done
	
	echo "<br />"
done

cat << _footer_
</body>
</html>
_footer_
