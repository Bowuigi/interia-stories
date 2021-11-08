sed -n '1,/STORIES_START/p' ../index.html > tmp.html

awk 'NR>2{gsub("\t+","\t");print}' info.tsv > info-tmp.tsv

awk -F '\t' \
	'{print "\t\t\t\t<a href=\"/interia-stories/stories/" $1 "\" download=\"" $1 "\">\n\t\t\t\t\t<p class=\"historia\">" $2 "</p>\n\t\t\t\t\t<p class=\"autor\">Por " $3 "</p>\n\t\t\t\t\t<p class=\"descripcion\">" $4 "</p>\n\t\t\t\t</a>"}' info-tmp.tsv \
	>> tmp.html

sed -n '/STORIES_END/,$p' ../index.html >> tmp.html

rm info-tmp.tsv
mv tmp.html ../index.html
