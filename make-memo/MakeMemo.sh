fileName=$(date '+%Y%m%d')
fileWrite=$(date '+%Y/%m/%d(%a)')

touch Desktop/${fileName}.txt
echo "${fileWrite}" > Desktop/${fileName}.txt
