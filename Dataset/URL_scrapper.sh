while read p; do
     lynx -dump $p | awk '/http/{print $2}' | nl >> imageLinks.txt
 done <links.txt
 sed -ni '/.jpg/p' imageLinks.txt