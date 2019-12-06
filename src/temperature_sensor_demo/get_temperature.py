import rospy
import glob
import time
import json
from ipfs_common.msg import Multihash
from ipfs_common.ipfs_rosbag import IpfsRosBag
from std_msgs.msg import String

def _read_temp_raw():
    base_dir = '/sys/bus/w1/devices/'
    device_folder = glob.glob(base_dir + '28*')[0]
    device_file = device_folder + '/w1_slave'

    f = open(device_file, 'r')
    lines = f.readlines()
    f.close()
    return lines


def get_temperature(no_sensor=False) -> Multihash:
    rospy.loginfo("Getting the temerature...")

    if no_sensor:
        res_str = {
            'temp_c': 21.0,
            'temp_f': 69.8
        }
    else:
        lines = _read_temp_raw()
        while lines[0].strip()[-3:] != 'YES':
            time.sleep(0.2)
            lines = read_temp_raw()
        equals_pos = lines[1].find('t=')
        if equals_pos != -1:
            temp_string = lines[1][equals_pos+2:]
            temp_c = float(temp_string) / 1000.0
            temp_f = temp_c * 9.0 / 5.0 + 32.0

            res_str = {
                'temp_c': temp_c,
                'temp_f': temp_f
            }

    rospy.loginfo("Current temerature is {}".format(res_str))
    topics = {
            "/data": [String(json.dumps(res_str))]
            }
    bag = IpfsRosBag(messages=topics)
    return bag.multihash

