#!/usr/bin/bash

curl -X POST -H 'Content-Type: application/json' -d '{ "query": "{ Page(page: 0) { pageInfo { total, perPage, currentPage, lastPage, hasNextPage } followers(userId: 5633296, sort: [USERNAME]) { id, name, isFollower, isFollowing, siteUrl } } }" }' https://graphql.anilist.co/ | jq .data.Page.pageInfo.total -r >> followers.count && cat followers.count | gnuplot -p -e 'set output "followers.png"; set terminal png; plot "/dev/stdin" title "Followers" with lines'
