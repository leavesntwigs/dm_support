#
# To run: awk -F '[<>]' -f extract_temp_alt.awk temp_alt.txt

BEGIN {
  ncolumns = 17 
  for (x = 1; x <= ncolumns; x++)
    temp[x] = "-333"
    header[x] = "na"
}
# /XmitterTempFault/{temp[1]= $3}
# /XmitterTemp/{temp[0]= $3;              header[0]=$2}   # check
# /XmitterTempFaultCount/{temp[3]= $3}
# /XmitterTempFaultTime/{temp[4]= $3}
/PloTemp/{temp[1]= $3; 			header[1]=$2}	# check
/EikTemp/{temp[2]= $3; 			header[2]=$2}  # check
/VLnaTemp/{temp[3]= $3; 		header[3]=$2}	# check
/HLnaTemp/{temp[4]= $3; 		header[4]=$2}   # check
/PolarizationSwitchTemp/{temp[5]= $3; 	header[5]=$2}	# check
/RfDetectorTemp/{temp[6]= $3; 		header[6]=$2}	# check
/NoiseSourceTemp/{temp[7]= $3; 		header[7]=$2}	# check
/Ps28VTemp/{temp[8]= $3; 		header[8]=$2}	# check
/RdsInDuctTemp/{temp[9]= $3; 		header[9]=$2}	# check
/InsTemp/{temp[10]= $3; 		header[10]=$2}   # check
/TailconeTemp/{temp[11]= $3; 		header[11]=$2}	# check
/PentekFpgaTemp/{temp[12]= $3; 		header[12]=$2}	# check
/PentekBoardTemp/{temp[13]= $3; 	header[13]=$2}	# check
/Cmigits3501Altitude/{temp[14]= $3; 	header[14]=$2}	# check
/RotationMotorTemp/{temp[15]= $3; 	header[15]=$2}   # check
/TiltMotorTemp/{temp[16]= $3; 	        header[16]=$2}  # check
/XmitterTemp>$/{temp[17]= $3;             header[17]=$2}   # check
END {
  if (printHeader == 1) {
    printf("time")
    for (x = 1; x <= ncolumns; x++)
      printf(",%s", header[x])
    print("\n")
  }
  printf("%d", time)
  for (x = 1; x <= ncolumns; x++)
    printf(",%5d", temp[x])
  print("\n")
}



# result:
# 1969 1969 0 18 0  7 27 32  3  2  3 35 28  9 10 -13  4 -1 -4 3819

# 1969 1969 0 28 0 22 33 34 23 24 21 26 24 19 20  20 21 43 36 87

