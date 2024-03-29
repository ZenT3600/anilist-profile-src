#!/usr/bin/bash

curl -X POST -H 'Content-Type: application/json' -d '{ "query": "{ Page(page: 0) { pageInfo { total, perPage, currentPage, lastPage, hasNextPage } followers(userId: 5633296, sort: [USERNAME]) { id, name, isFollower, isFollowing, siteUrl } } }" }' https://graphql.anilist.co/ | jq .data.Page.pageInfo.total -r >> $1/followers.count
cat $1/followers.count | tail -n750 | gnuplot -p -e 'set output "'$1'/followers.png"; set lmargin at screen 0.1; set terminal png; set yrange['$(($(cat $1/followers.count | sort -n | head -n1) - 10))':'$(($(cat $1/followers.count | sort -n | tail -n1) + 25))']; unset xtics; set ytics add ("'$(cat $1/followers.count | tail -n1)'" '$(cat $1/followers.count | tail -n1)'); plot "-" title "Followers" with lines lw 2'
