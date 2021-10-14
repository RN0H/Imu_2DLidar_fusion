#!/home/rohan/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 



import rospy
from std_msgs.msg import String 
from pracs.msg import mymsg
import numpy as np
import random
from random import choices


class pubs:
		def __init__(self):
			self.pub = rospy.Publisher("chat", mymsg, queue_size = 10)	# topic_name = chat
			rospy.init_node('talker', anonymous = True)				# node_name  = talker
			self.msg = mymsg()
			self.rate = rospy.Rate(1)

		def talk(self):
			while not rospy.is_shutdown():
			   self.msg.name = random.choice([i  for i in "abcdefghijklmnopqrstuvwxyz"]);
			   self.msg.age, self.msg.weight = random.randint(1,110), random.randint(1,200)*1.01
			   self.msg.header.stamp = rospy.Time.now()
			   self.msg.array.append(random.randint(1,10))
			   self.pub.publish(self.msg);
			   self.rate.sleep()

if __name__ == "__main__":
	try:
		pubs().talk();
	except rospy.ROSInterruptException:
		pass


