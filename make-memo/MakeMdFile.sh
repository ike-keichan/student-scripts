fileName=$(date '+%Y%m%d') 
fileWrite=$(date '+%Y/%m/%d(%a)')
touch ~/Desktop/${fileName}.md
echo -e "# タイトル\n***\n\n${fileWrite}\n\n ## サブタイトル\n +" > ~/Desktop/${fileName}.md
