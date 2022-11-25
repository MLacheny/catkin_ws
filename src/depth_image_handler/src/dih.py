#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
import numpy as np
import cv2
from cv_bridge import CvBridge

def callback(di):
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(di, desired_encoding = 'passthrough')
    print("callback 1 : ", di.header.seq)
    #print(img[di.height//2][di.width//2])

def print_im(ros_img):
    bridge = CvBridge()
    img = bridge.imgmsg_to_cv2(ros_img, desired_encoding = 'passthrough')
    img = np.copy(img)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    print("callback 2 : ", ros_img.header.seq)
    #cv2.imshow('image', img)
    #cv2.waitKey(0)
    #cv2.destroyAllWindows()

if __name__ == '__main__':
    rospy.init_node('dih', anonymous = True)
    rospy.Subscriber('/camera/depth/image', Image, callback)
    rospy.Subscriber('/camera/rgb/image_rect_color', Image, print_im)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        rate.sleep()
