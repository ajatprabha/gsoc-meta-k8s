update-stats:
	curl --request POST --url https://api.github.com/graphql \
	--header "authorization: Bearer ${GITHUB_TOKEN}" --header 'content-type: application/json' \
	--data '{"query":"{search(query:\"org:kubernetes author:ajatprabha\", type:ISSUE, first:100){repositoryCount edges{node {... on PullRequest {__typename title number url repository{name}} ... on Issue {__typename title number url repository{name}}}}}}"}' \
	> data/contrib.json