#!/usr/bin/bash

curl -X POST -H 'Content-Type: application/json' -d '{ "query": "{ Page(page: 0) { pageInfo { total, perPage, currentPage, lastPage, hasNextPage } followers(userId: 5633296, sort: [USERNAME]) { id, name, isFollower, isFollowing, siteUrl } } }" }' https://graphql.anilist.co/ | jq .data.Page.pageInfo.total -r >> $1/followers.count && cat $1/followers.count | gnuplot -p -e 'set output "'$1'/followers.png"; set lmargin 1; set rmargin 1; set tmargin 1; set bmargin 1; set terminal png; plot "/dev/stdin" title "Followers" with lines'
