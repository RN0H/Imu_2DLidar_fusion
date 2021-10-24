#!/home/rohan/projects/3py/bin/python3

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 


import rospy
from std_msgs.msg import Float64MultiArray, MultiArrayDimension
import numpy as np

class multiarrs:
	def __init__(self):
		rospy.init_node("just_trying_multi_arrays")
		self.pub = rospy.Publisher("multi_arrays",Float64MultiArray,queue_size = 10)
		self.rate = rospy.Rate(1)
		self.msg = Float64MultiArray()
		self.msg.layout.data_offset = 0
		self.msg.layout.dim = [MultiArrayDimension(), MultiArrayDimension()]
		self.msg.layout.dim[0].label = "channels"
		self.msg.layout.dim[0].size = 2
		self.msg.layout.dim[0].stride = 12
		self.msg.layout.dim[1].label = "samples"
		self.msg.layout.dim[1].size = 8
		self.msg.layout.dim[1].stride = 8

	
	def trial(self):
		while not rospy.is_shutdown():
			self.msg.data = [np.random.randn() for i in range(16)]
			self.pub.publish(self.msg)
			self.rate.sleep()

if __name__ == "__main__":
	try:
		rospy.loginfo("starting in 2s..")
		rospy.sleep(2)
		multiarrs().trial()
	except rospy.ROSInterruptException:
		rospy.loginfo("------------end----------")
		pass

