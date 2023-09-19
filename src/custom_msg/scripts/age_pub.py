#!/usr/bin/env python3

import rospy
from custom_msg.msg import age  # Import the custom Age message
from random import randint  # For generating a random age

def age_publisher():
    rospy.init_node('age_publisher', anonymous=True)
    pub = rospy.Publisher('robot_age', age, queue_size=10)

    rate = rospy.Rate(1)  # Publish once per second

    while not rospy.is_shutdown():
        age_msg = age()
        age_msg.days = randint(0,29)
        age_msg.years = randint(1, 10)  # Replace with your age data
        age_msg.months = randint(0, 11)  # Replace with your age data

        rospy.loginfo("Publishing Robot Age: %d days,%d years, %d months", age_msg.days, age_msg.years, age_msg.months)
        pub.publish(age_msg)

        rate.sleep()

if __name__ == '__main__':
    try:
        age_publisher()
    except rospy.ROSInterruptException:
        pass





