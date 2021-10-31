#include <ros/ros.h>
#include <std_msgs/Int32.h>


void getdata(const std_msgs::Int32::ConstPtr& msg){
	ROS_INFO("I heard: [%d]",msg->data);
}

int main(int argc ,char** argv)
{
     //Initialize and start the node
     ros::init(argc, argv, "sub");
     ros::NodeHandle nh;
     ros::Subscriber sub = nh.subscribe("cpp_pub_topic", 1000, getdata);
     ros::spin();
     return 0;
 }