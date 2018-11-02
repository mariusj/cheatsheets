#merge two repositories into one

# rewrite history on old repo
git filter-branch --index-filter \
    'git ls-files -s | sed "s,\t,&'"projecta"'/," |
     GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
     git update-index --index-info &&
     mv $GIT_INDEX_FILE.new $GIT_INDEX_FILE' HEAD
	 

# merge first repo
git pull projectb
# merge second repo
git pull projectb --allow-unrelated-histories
