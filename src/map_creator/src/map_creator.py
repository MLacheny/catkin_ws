#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from nav_msgs.msg import OccupancyGrid
import numpy as np
import cv2

def callback(map_msg):
    print(map_msg.info.width, map_msg.info.height, len(map_msg.data))
    map_matrix = np.reshape(map_msg.data,(map_msg.info.width,map_msg.info.height))
    map_matrix[map_matrix==-1] = 0
    map_matrix = np.uint8(map_matrix)
    map_matrix[map_matrix==100]=255
    cv2.imwrite("test.png", map_matrix)
    
if __name__ == '__main__':
    distance = 0
    rospy.init_node('map_creator', anonymous = True)
    rospy.Subscriber("/map", OccupancyGrid, callback)
    # pub = rospy.Publisher("/test_vel", Float64, queue_size=1)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        # print(distance)
        rate.sleep()
