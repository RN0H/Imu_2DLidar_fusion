#!/home/rohan/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 

import rospy
from std_msgs.msg import String,Float64MultiArray
from sensor_msgs.msg import LaserScan
from pracs.msg import mymsg, fuse
from sensor_msgs.msg import LaserScan

#added waiting flag for better sync
class fusion:
	def __init__(self):
		rospy.init_node("fusion", anonymous = True)
		self.waiting = False
		self.pubmsg = fuse()
		for i in ("x","y","z","roll","yaw","pitch"):
			setattr(self.pubmsg,i,[])
		self.pub = rospy.Publisher("fuson_topic",fuse,queue_size = 1)
		rospy.loginfo("in init")
		rospy.Subscriber("imu",mymsg,self.imu_sub)
		rospy.Subscriber("scan",LaserScan,self.laser_sub)


	def laser_sub(self,data):
		if self.waiting:
			rospy.loginfo("in Laser at {}".format(rospy.get_time()))
			if len(self.pubmsg.ranges)==500:self.pubmsg.ranges.clear()
			self.pubmsg.ranges.extend(data.ranges)
			self.pubmsg.len = len(self.pubmsg.ranges)
			self.waiting = False



	def imu_sub(self,data):
		if not self.waiting:			
			rospy.loginfo("in IMu at {}".format(rospy.get_time()))
			if len(self.pubmsg.x)>=5:
				for i in ("x","y","z","roll","yaw","pitch"):
					setattr(self.pubmsg,i,[])				
			self.pubmsg.x.append(data.x)
			self.pubmsg.y.append(data.y)
			self.pubmsg.z.append(data.z)
			self.pubmsg.roll.append(data.roll)
			self.pubmsg.pitch.append(data.pitch)
			self.pubmsg.yaw.append(data.yaw)
			self.pubmsg.header.stamp = rospy.Time.now()
			self.waiting = True
			self.pub.publish(self.pubmsg)
		



if __name__ == "__main__":
	try:
		fusion()
		rospy.spin()
	except rospy.ROSInterruptException:
		pass