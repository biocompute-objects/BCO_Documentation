#!/bin/sh -l

branch_name=$(git symbolic-ref --short -q HEAD)

git log main..$branch_name --pretty=format:"{  'commit': '%H', 'author': '%aN',  'email': '%aE',  'date': '%ad',  'subject': '%f',  'message': '%b'},"     $@ | sed -e "s/\"//g"| sed -e "s/'/\"/g" | tr '\n\r' ' '|     perl -pe 'BEGIN{print "["}; END{print "]"}' |     perl -pe 's/}, ]/}]/' > ./scripts/git-log.json

git log main..$branch_name --numstat     --format='%H' $@ | perl -lawne ' if (defined $F[1]) {            print qq#{"insertions": "$F[0]", "deletions": "$F[1]", "path":"$F[2]"},#        } elsif (defined $F[0]) {            print qq#],\n"$F[0]": [#        };        END{print qq#],#}' | tail -n +2 | perl -wpe 'BEGIN{print "{"}; END{print "}"}' | tr '\n\r' ' ' | perl -wpe 's#(]|}),\s*(]|})#$1$2#g' | perl -wpe 's#,\s*?}$#}#' > ./scripts/git-stat.json

python ./scripts/change_log.py -b $branch_name 