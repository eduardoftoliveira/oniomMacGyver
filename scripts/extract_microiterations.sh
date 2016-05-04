grep -A 5 orientation  |awk -v n= -v x= '{ if (  ~ /[0-9]/ ) print ,,, } { if ( == Center) print n } { if ( == Number) print x }'
