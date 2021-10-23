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
			setattr(self.pubmsg,i,[])
		self.pub = rospy.Publisher("fusion_topic",fuse,queue_size = 10)
		rospy.Subscriber("imu",mymsg,self.imu_sub)
		rospy.Subscriber("scan",LaserScan,self.laser_sub)


	def laser_sub(self,data):
		self.pubmsg.ranges = data.ranges
		rospy.loginfo("Got laser_data at")


	def imu_sub(self,data):
		if len(self.pubmsg.x)>=20:
			for i in ("x","y","z","roll","yaw","pitch"):
					setattr(self.pubmsg,i,[])
		self.pubmsg.x.append(data.x)
		self.pubmsg.y.append(data.y)
		self.pubmsg.z.append(data.z)
		self.pubmsg.roll.append(data.roll)
		self.pubmsg.pitch.append(data.pitch)
		self.pubmsg.yaw.append(data.yaw)
		rospy.loginfo("Got imu_data at")
		self.pub.publish(self.pubmsg)
		



if __name__ == "__main__":
	try:
		fusion()
		rospy.spin()
	except rospy.ROSInterruptException:
		pass