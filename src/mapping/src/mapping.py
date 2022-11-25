#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Fri Apr  8 14:39:33 2022

@author: asus
"""

import rospy
from std_msgs.msg import Float64
from sensor_msgs.msg import LaserScan
import numpy as np
import Im_fuser as imf
import cv2

global map_prec
global distance
global glob_map
global is_empty
global no_map
no_map = True
distance = Float64()
is_empty = 0
size = 250
or_act = 0


def display_map(lidmap):
    for i in lidmap:
        for j in i:
            if(j):
                print('|', end = '')
            else:
                print(" ", end = '')
        print("")
    print("")

def up_map(data):
    # print(len(data.ranges))
    global is_empty
    global glob_map
    global distance
    global no_map
    lidmap = np.full((size,size), 0, dtype=np.uint8)
    angle = 0
    angle_increment = 2*np.pi/len(data.ranges)
    data.ranges = np.copy(data.ranges)
    data.ranges[data.ranges > data.range_max] = 0
    data.ranges[data.ranges < data.range_min] = 0
    scale = (size/2-1)/data.range_max
    for amp in data.ranges:
        # print(scale * amp, np.cos(angle), np.sin(angle))
        i = size/2 + scale * amp * np.cos(angle)
        j = size/2 + scale * amp * np.sin(angle)
        lidmap[int(i-1), int(j-1)]=255
        lidmap[int(i-1), int(j)]=255
        lidmap[int(i-1), int(j+1)]=255
        lidmap[int(i), int(j-1)]=255
        lidmap[int(i), int(j)]=255
        lidmap[int(i), int(j+1)]=255
        lidmap[int(i+1), int(j-1)]=255
        lidmap[int(i+1), int(j)]=255
        lidmap[int(i+1), int(j+1)]=255
        angle += angle_increment
    # if is_empty:
    if(no_map):
        glob_map = lidmap
        no_map = False
    distance, img, angle = imf.image_fus(glob_map, lidmap)
    glob_map = lidmap
    if is_empty%10 == 0:
        name = "test_" + ".png"
        name1 = "img1_" + ".png"
        name2 = "img2_" + ".png"
        cv2.imwrite(name, img)
        cv2.imwrite(name1, glob_map)
        cv2.imwrite(name2, lidmap)
        print(angle)
    is_empty += 1

    # glob_map = imf.image_fus(glob_map, lidmap)
        
        
if __name__ == '__main__':
    distance = 0
    rospy.init_node('mapping', anonymous = True)
    rospy.Subscriber("/scan", LaserScan, up_map)
    pub = rospy.Publisher("/test_vel", Float64, queue_size=1)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        # print(distance)
        pub.publish(distance)
        rate.sleep()
