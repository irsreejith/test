# Here is how we are setting the variable 'branches'
ALL_BRANCHES=`git ls-remote . | cut -d $'\t' -f 2` # THIS WILL INCLUDE THE FOLDER AS PREFIX
includePattern= 
IFS=, read -a patterns <<EOF
$INCLUDE_PATTERN
EOF
for pattern in "${patterns[@]}"; do
  includePattern+=" -e $REMOTE_FOLDER$pattern"
done
echo $includePattern
echo $ALL_BRANCHES
branches=`echo "$ALL_BRANCHES" | eval "grep $includePattern"`

echo "B = $branches"
#echo "C = git merge -q --no-edit $branches"
#git merge -q --no-edit $branches
