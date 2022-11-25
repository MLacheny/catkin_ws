#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import numpy as np
from std_msgs.msg import Float64MultiArray, MultiArrayLayout, MultiArrayDimension
from ecobot.srv import ussensor_mngt, ussensor_mngtResponse

# ====================
# Class describing the US sensors array
# ====================
class USsensor:
    def __init__(self):
        self.rate=1         # Publication rate
        self.sensor_nb=12   # Number of US sensor
        
        # Definition of the message to publish
        self.message=Float64MultiArray()
        self.message.layout = MultiArrayLayout()
        self.message.layout.dim = []
        self.message.layout.dim.append(MultiArrayDimension("times of flight", self.sensor_nb, 1))

        # Definition of the array for deactivation
        self.deactivated=np.array([1.0]*self.sensor_nb)
        
        # Init everything (node + service)
        rospy.init_node('ecobot_usarray', anonymous=False)
        rospy.Service('usarray_mngt', ussensor_mngt, self.sevice_deactivate_sensor)
        self.pub = rospy.Publisher('/usarray', Float64MultiArray, queue_size=10)

    # ---------------------------
    # Publisher of the US data
    # ---------------------------
    def publish_sensor(self):
        r = rospy.Rate(self.rate)
        while not rospy.is_shutdown(): # Publication loop
            # Simulate sensors from the 4 directions

            front = (10.2-9.8)*np.random.random_sample(size=int(self.sensor_nb/4))+9.8
            right = (8.1-8)*np.random.random_sample(size=int(self.sensor_nb/4))+8
            back = (4.3-4)*np.random.random_sample(size=int(self.sensor_nb/4))+4
            right[2]=np.random.choice([-1,100]) 
            left = (11.7-11.5)*np.random.random_sample(size=int(self.sensor_nb/4))+11.5
            
            # Create the message and publish
            self.message.data = 0.001*np.multiply(np.concatenate((left, right, front, back)),self.deactivated)

            self.pub.publish(self.message) 
            r.sleep()
    
    # ---------------------------
    # Service for the sensor deactivaton
    # ---------------------------
    def sevice_deactivate_sensor(self, request):

        # List currently deactivated sensor IDs
        deactivated_id = []
        if not np.all((self.deactivated==1)):
            position = np.argwhere(np.isnan(self.deactivated))
            for pos in position:
                deactivated_id.append(int(pos+1))

        # If we want to activate a sensor
        if request.message == "ACTIVATE":
            # First check if parameters are OK
            if request.sensor_id > 0 and request.sensor_id <= self.sensor_nb:
                # Deactivate the sensor
                if request.sensor_id in deactivated_id:
                    self.deactivated[request.sensor_id-1] = 1
                    deactivated_id.remove(int(request.sensor_id))
                    response = "Sensor with ID " + str(request.sensor_id) + " is activated."
                # Oups, it was already deactivated!
                else: 
                    response = "Sensor with ID " + str(request.sensor_id) + " is ALREADY activated."
            else:
                response = "Wrong number of sensor."    

        # If we want to deactivate a sensor
        elif request.message == "DEACTIVATE":
            # First check if parameters are OK            
            if request.sensor_id > 0 and request.sensor_id <= self.sensor_nb:
                # Oups, sensor is alread deactivated!
                if request.sensor_id in deactivated_id:
                    response = "Sensor with ID " + str(request.sensor_id) + " is ALREADY deactivated." 
                # Else, deactivate it
                else:
                    self.deactivated[request.sensor_id-1] = np.nan
                    deactivated_id.append(int(request.sensor_id))
                    response = "Sensor with ID " + str(request.sensor_id) + " is DEactivated"
            else:
                response = "Wrong sensor ID."    

        # If we are just interested in knowing which sensor is deactivated or not
        elif request.message == "STATUS":
            if len(deactivated_id)==0:
                response = "All Sensors are activated"
            else: 
                number = ""
                for sid in deactivated_id:
                    number =  number + " " + str(sid)
                    response = "Sensor(s) with ID" + number + " is/are OFF"

        # Wrong request
        else:
            response = "Error. Only ACTIVATE, DEACTIVATE or STATUS are supported in this service."

        return ussensor_mngtResponse(response,deactivated_id)

# ====================
# Main function
# ====================
if __name__ == '__main__':
    try:
        sensor = USsensor()
        sensor.publish_sensor()

    except rospy.ROSInterruptException:
        pass
