
# ----  changes needed here ----

YYYYMMDD = '20190822'

# ---- end changes needed ----


import pandas as pd
import matplotlib.pyplot as plt

# temp_data = pd.read_csv('20190822.txt')
temp_data = pd.read_csv(YYYYMMDD + '.txt')
temp_data

fig, axes = plt.subplots(nrows=5, ncols=1, 
   # sharex=True
)

# Set spacing to zero
plt.subplots_adjust(wspace=0, hspace=0)

# fig.show()

temp_data.plot(ax=axes[0], x='time', y=['Cmigits3501Altitude'], ylabel='Altitude (?)',
   xticks=[],
   xlabel="",
   # legend=[loc="lower right"],
)
axes[0].legend(
   fontsize=6,
   #loc="lower right",
   loc="best",
   # ncol=len(yfields),
)

yfields = ['PentekFpgaTemp', 'PentekBoardTemp','Ps28VTemp']
temp_data.plot(ax=axes[1], x='time', 
   y=yfields, 
   ylabel='Temp [C]', 
   xticks=[],
   xlabel="",
)
axes[1].legend(
   fontsize=6,
   #loc="lower right",
   loc="best",
   ncol=len(yfields),
   labels=[s.replace('Temp','') for s in yfields],
)

yfields = ['VLnaTemp', 'HLnaTemp', 'XmitterTemp']
temp_data.plot(ax=axes[2], x='time', 
   y=yfields,
   ylabel='Temp [C]', 
   xticks=[],
   xlabel="",
)
axes[2].legend(
   fontsize=6,
   #loc="lower right",
   loc="best",
   ncol=len(yfields),
   labels=[s.replace('Temp','') for s in yfields],
)

yfields = ['RotationMotorTemp', 'TiltMotorTemp', 'EikTemp', 'PolarizationSwitchTemp', 'RfDetectorTemp', 'NoiseSourceTemp', 'PloTemp', 'RdsInDuctTemp']
temp_data.plot(ax=axes[3], x='time', 
   y=yfields,
   ylabel='Temp [C]', 
   ylim=[-5,55],
   xticks=[],
   xlabel="",
)
axes[3].legend(
   fontsize=4,
   loc="best",
   ncol=len(yfields),
   labels=[s.replace('Temp','') for s in yfields],
)

yfields = ['InsTemp','TailconeTemp']
temp_data.plot(ax=axes[4], x='time', 
   y=yfields,  
   ylabel='Temp [C]',
   xlabel=YYYYMMDD + ' time',
   fontsize=8,
)
axes[4].legend(
   fontsize=6,
   #loc="lower right",
   loc="best",
   ncol=len(yfields),
   labels=[s.replace('Temp','') for s in yfields],
)
# fig.show()
plt.ylabel('Temp [C]', fontsize = 8)

plt.suptitle('OTREC')

# fig.rcParams["axes.labelsize"] = 4 
# Iterate through all Axes objects and add vertical grid lines
for ax in axes:
   ax.grid(axis='x') # , linestyle='--', alpha=0.6) # Customize linestyle and transparency


plt.savefig(YYYYMMDD + '.png')
