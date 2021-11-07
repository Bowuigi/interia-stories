
sed -n '1,/STORIES_START/p' ../index.html > tmp.html

awk -F '\t' \
	'{print "<a href=\"/interia-stories/stories/" $1 "\" download=\"" $1 "\">\n" "\t<p class=\"historia\">" $2 "</p>\n\t<p class=\"autor\">Por " $3 "</p>\n\t<p class=\"descripcion\">" $4 "</p>\n</a>"}' info.tsv \
	>> tmp.html

sed -n '/STORIES_END/,$p' ../index.html >> tmp.html

mv tmp.html ../index.html
