#include <ros/ros.h>
#include <turtlesim/Pose.h> //adding the turtle pose to see it

void counterCallback(const turtlesim::Pose::ConstPtr& msg)// changed the msg type to match the turtle msg
{

    ROS_INFO("%f", msg->x );
    ROS_INFO("%f", msg->theta );
}

int main(int argc, char** argv)
 {
    ros::init(argc, argv,"pose_sub_node");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/turtle1/pose", 100, counterCallback); // counter call back control how the output should appears
    ros::spin();
    return 0;
}