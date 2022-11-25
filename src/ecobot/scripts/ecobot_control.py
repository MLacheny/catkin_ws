#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
from std_msgs.msg import String

# Callback function for reading velocity command
def read_cmd_callback(msg):
	print("---------------------------")
	print(msg)
	print("---------------------------")

if __name__ == '__main__':
    try:
        rospy.init_node('ecobot_control', anonymous=False, log_level=rospy.INFO)

        # We subscribe to /cmd_vel topic
        sub = rospy.Subscriber('/proximity_detection', String, read_cmd_callback)

        print("Reading command for ecobot")
        print("---------------------------")
        
        # And then ... wait for the node to be terminated
        rospy.spin()

    except rospy.ROSInterruptException:
        pass
