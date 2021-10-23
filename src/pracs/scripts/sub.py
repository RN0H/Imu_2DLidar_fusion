#!/home/rohan/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import LaserScan
from pracs.msg import mymsg, fuse
from sensor_msgs.msg import LaserScan

class fusion:
	def __init__(self):
		rospy.init_node("fusion", anonymous = True)
		self.pubmsg = fuse()
		for i in ("x","y","z","roll","yaw","pitch"):
			setattr(self.pubmsg,i,0.0)
		self.pub = rospy.Publisher("fusion_topic",fuse,queue_size = 10)
		rospy.Subscriber("scan",LaserScan,self.laser_sub)
		rospy.Subscriber("imu",mymsg,self.imu_sub)


	def laser_sub(self,data):
		self.pubmsg.ranges = data.ranges
		rospy.loginfo("Got laser_data at")


	def imu_sub(self,data):
		self.pubmsg.x     	= data.x
		self.pubmsg.y       = data.y
		self.pubmsg.z       = data.z
		self.pubmsg.roll    = data.roll
		self.pubmsg.pitch   = data.pitch
		self.pubmsg.yaw     = data.yaw
		rospy.loginfo("Got imu_data at")
		self.pub.publish(self.pubmsg)
		



if __name__ == "__main__":
	try:
		fusion()
		rospy.spin()
	except rospy.ROSInterruptException:
		pass