#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr 10 11:35:07 2022

@author: asus
"""

import cv2
import os
import numpy as np
import time

def translate_image(image, tx, ty):
    M = np.float32([[1,0,tx],[0,1,ty]])
    result = cv2.warpAffine(image, M, image.shape[1::-1], flags=cv2.INTER_LINEAR)
    return result
    
def rotate_image(image, angle, center):
    rot_mat = cv2.getRotationMatrix2D(center, angle, 1.0)
    result = cv2.warpAffine(image, rot_mat, image.shape[1::-1], flags=cv2.INTER_LINEAR)
    return result

def unit_vector(vector):
    return vector / np.linalg.norm(vector)

def angle_between(v1, v2):
    v1_u = unit_vector(v1)
    v2_u = unit_vector(v2)    
    angle = np.sign(v1_u[1]) * np.arccos(v1_u[0]) - np.sign(v2_u[1]) * np.arccos(v2_u[0])
    if(angle <= np.pi):
        return (angle + 2*np.pi)
    if(angle > np.pi):
        return(angle - 2*np.pi)
    return angle

def dist(p1,p2):
    return np.sqrt((p1[0]-p2[0])**2 + (p1[1]-p2[1])**2)

def getkp(img, mask):
    imgcp = img.copy()

    sift = cv2.SIFT_create(nfeatures = 100)
    kp, grad = sift.detectAndCompute(imgcp,mask=mask)

    imgcp = cv2.drawKeypoints(imgcp, kp, imgcp)
    return (kp,grad,imgcp)

def image_fus(img1,img2):
    kp1, des1, imgk1 = getkp(img1,None)
    kp2, des2, imgk2 = getkp(img2,None)

    # create BFMatcher object
    bf = cv2.BFMatcher()

    # Match descriptors.
    matches = bf.knnMatch(des1,des2,k=2)

    # Apply ratio test
    good = []
    for m,n in matches:
        # print(m.queryIdx,n.queryIdx)
        if m.distance < 0.75*n.distance:
            good.append([m])

    angle = np.array([])
    pos = np.array([[], []])
    for i in range(len(good)-1):
        v1 = [kp1[good[i][0].queryIdx].pt[0] - kp1[good[i+1][0].queryIdx].pt[0], kp1[good[i][0].queryIdx].pt[1] - kp1[good[i+1][0].queryIdx].pt[1]]
        v2 = [kp2[good[i][0].trainIdx].pt[0] - kp2[good[i+1][0].trainIdx].pt[0], kp2[good[i][0].trainIdx].pt[1] - kp2[good[i+1][0].trainIdx].pt[1]]
        if(v1 != v2):
            angle = np.append(angle, angle_between(v1, v2)*180/np.pi)
            pos = np.append(pos, [kp1[good[i][0].queryIdx].pt, kp2[good[i][0].trainIdx].pt],axis = 1)
            # print("distance :")

    moy = np.mean(angle)
    ser = np.abs(angle - moy)
    arg_best = np.argmin(ser)

    pos_best = pos[:,2*arg_best:2*arg_best+2]

    x1,x2 = pos_best[0][0],pos_best[1][0]
    y1,y2 = pos_best[0][1],pos_best[1][1]

    # img2 = rotate_image(img2, -angle[arg_best]*180/np.pi, (125, 125))

    co = np.cos(-angle[arg_best])
    so = np.sin(-angle[arg_best])

    pos_best[1][1], pos_best[1][0] = co*(pos_best[1][1]-125)-so*(pos_best[1][0]-125)+125, so*(pos_best[1][1]-125)+co*(pos_best[1][0]-125)+125

    x1,x2 = pos_best[0][0],pos_best[1][0]
    y1,y2 = pos_best[0][1],pos_best[1][1]
    img3 = cv2.drawMatchesKnn(img1,kp1,img2,kp2,good,None)


    return (np.sqrt((x2-x1)**2 + (y2-y1)**2), img3, angle[arg_best])

# absolute_path = os.path.join(os.getcwd(), 'Brain1.png')
# img1 = cv2.imread(absolute_path,0)

# absolute_path = os.path.join(os.getcwd(), 'Brain2.png')
# img2 = cv2.imread(absolute_path,0)



# t1 = time.time()


# img3 = image_fus(img1,img2)
# # cv.drawMatchesKnn expects list of lists as matches.
# # img3 = cv2.drawMatchesKnn(img1,kp1,img2,kp2,good,None,flags=cv2.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)


# t2 = time.time()
# print(t2-t1)

# cv2.imshow('coucou1', img1)
# cv2.imshow('coucou2', img2)
# cv2.imshow('coucou2', img3)

# cv2.waitKey(0)
# cv2.destroyAllWindows()