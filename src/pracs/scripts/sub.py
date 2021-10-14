#!/home/rohan/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import LaserScan

def laser_reader(msg):
	rospy.loginfo("Received {}".format(msg))

def listen():
	rospy.Subscriber("scan", LaserScan, laser_reader)
	rospy.init_node("listner", anonymous = True)
	rospy.spin()

if __name__ == "__main__":
	try:
		listen()
	except rospy.ROSInterruptException:
		pass