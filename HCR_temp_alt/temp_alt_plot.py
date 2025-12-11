
import pandas as pd
import matplotlib.pyplot as plt
temp_data = pd.read_csv('20190822.txt')
temp_data
fig, axes = plt.subplots(nrows=5, ncols=1)
fig.show()
temp_data.plot(ax=axes[0], x='time', y=['Cmigits3501Altitude'], ylabel='Altitude (?)')
temp_data.plot(ax=axes[1], x='time', y=['PentekFpgaTemp', 'PentekBoardTemp','Ps28VTemp'], ylabel='Temperature [C]', xlabel='20190822')
temp_data.plot(ax=axes[2], x='time', y=['VLnaTemp', 'HLnaTemp', 'XmitterTemp'], ylabel='Temperature [C]', xlabel='20190822')
temp_data.plot(ax=axes[3], x='time', y=['RotationMotorTemp', 'TiltMotorTemp', 'EikTemp', 'PolarizationSwitchTemp', 'RfDetectorTemp', 'NoiseSourceTemp', 'PloTemp', 'RdsInDuctTemp'],  ylabel='Temperature [C]', xlabel='20190822')
temp_data.plot(ax=axes[4], x='time', y=['InsTemp','TailconeTemp'],  ylabel='Temperature [C]', xlabel='20190822')
fig.show()
