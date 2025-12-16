#!/bin/csh

# ---- changes needed here ----
# remove temp output file YYYYMMDD.txt

#set DIR = '/Users/brenda/data/OTREC/20190928'
# set DIR = '/scr/sci/brenda/SOCRATES/brend274550/20180224'
set DIR = '/scr/sci/brenda/CSET/20150803'

# set the awk offsets to get the YYYYMMDD and HHMMSS
#
# ---- end of changes needed -----


set FILES=`ls -d $DIR/*`
set first=1

foreach file ( $FILES )
  echo $file 
  #                                cfrad.20190822_191500.100_to_20190822_191807.300_HCR_otrec.nc
  # /Users/brenda/data/OTREC/20190822/cfrad.20190822_191500.100_to_20190822_191807.300_HCR_otrec.nc : 41,8; 50,6
  # /scr/sci/brenda/SOCRATES/brend274550/20180219/cfrad   # 53,8; 62,6 ?
  # /scr/sci/brenda/CSET/20150812/cfrad.2	          # 37,8; 46,6
  # 
  set YYYYMMDD = `echo $file | awk '{print substr($0,37,8)}'` # = "20190822"
  set HHMMSS =   `echo $file | awk '{print substr($0,46,6)}'` # = "191500"
  echo $YYYYMMDD, $HHMMSS
  RadxPrint -f $file | awk '/HcrStatus/,/<\/HcrStatus/' | awk -v time=$HHMMSS -v printHeader=$first  -F '[<>]' -f extract_temp_alt.awk >> ~/for_Jonathan_HCR_temp/$YYYYMMDD.txt
  if ($first == 1) then
    set first=0
  endif
end

