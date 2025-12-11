#!/bin/csh

set DIR = '/Users/brenda/data/OTREC/20190822'

set FILES=`ls -d $DIR/*`
set first=1

foreach file ( $FILES )
  echo $file 
  #                                cfrad.20190822_191500.100_to_20190822_191807.300_HCR_otrec.nc
  # /Users/brenda/data/OTREC/20190822/cfrad.20190822_191500.100_to_20190822_191807.300_HCR_otrec.nc
  # 
  set YYYYMMDD = `echo $file | awk '{print substr($0,41,8)}'` # = "20190822"
  set HHMMSS =   `echo $file | awk '{print substr($0,50,6)}'` # = "191500"
  echo $YYYYMMDD, $HHMMSS
  RadxPrint -f $file | awk '/HcrStatus/,/<\/HcrStatus/' | awk -v time=$HHMMSS -v printHeader=$first  -F '[<>]' -f extract_temp_alt.awk >> ~/for_Jonathan_HCR_temp/$YYYYMMDD.txt
  if ($first == 1) then
    set first=0
  endif
end

