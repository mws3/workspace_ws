#!/usr/bin/env python3
import rospy
from custom_msg.msg import sensor_data #importing my custom message as a class 
import random #give me a random variable 

#create a new publisher. we specify the topic name, then type of message then the queue size
pub = rospy.Publisher('sensor_topic', sensor_data, queue_size=10)
#we need to initialize the node
rospy.init_node('publisher_node', anonymous=True)
#set the loop rate
rate = rospy.Rate(0.5) # 1hz
#keep publishing until a Ctrl-C is pressed
i = 0 # counter 

while not rospy.is_shutdown():
    sensor = sensor_data() #taking an object from sensor_data (sensor contains now id name temp humidity )
    sensor.id = 1
    sensor.name="parking_01"
    sensor.temperature = 24.33 + (random.random()*2)
    sensor.humidity = 33.41+ (random.random()*2)
    rospy.loginfo("I publish:")
    rospy.loginfo(sensor)
    pub.publish(sensor)
    rate.sleep()
    i=i+1