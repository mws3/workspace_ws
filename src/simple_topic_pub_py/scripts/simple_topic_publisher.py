#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist

def main():
    rospy.init_node('simple_topic_publisher')
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
    rate = rospy.Rate(10)  # 10 Hz

    while not rospy.is_shutdown():
        twist_msg = Twist()
        twist_msg.linear.x = 0.5  # Adjust the linear velocity as needed
        twist_msg.angular.z = 0 # No angular velocity
        pub.publish(twist_msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
