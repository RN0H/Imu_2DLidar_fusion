#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder

import rospy
from nav_msgs.msg import OccupancyGrid
from sensor_msgs.msg import LaserScan, PointCloud2 as pcl2
from tf.transformations import quaternion_from_euler
from pracs.msg import mymsg # for imu attrs

class Maps:
	def __init__ (self):
		rospy.init_node('mymapps')
		self.grid_msg = OccupancyGrid()
		self.grid_msg.header.frame_id = 'map_header'
		self.grid_msg.info.resolution = 0.4
		self.grid_msg.info.width = 10 #int(self.map_size_x / self.map_resolution)
		self.grid_msg.info.height = 10 #int(self.map_size_y / self.map_resolution)
		self.grid_msg.info.origin.position.x = 0
		self.grid_msg.info.origin.position.y = 0
		self.grid_msg.info.origin.position.z = 0

		self.grid_pub       =   rospy.Publisher("mymap",OccupancyGrid,queue_size = 2)
		
		self.grid_laser_sub =   rospy.Subscriber("pcl2",pcl, self.scan)
		self.grid_poses_sub =   rospy.Subscriber("BunchOfPoses",mymsg , self.poses)


	def scan(self,data):
		self.grid_msg.data = data.ranges


	def poses(self,data):
		q = quaternion_from_euler(data.roll, data.yaw, data.pitch)
		data.header.stamp = rospy.Time.now()
		self.grid_msg.info.origin.orientation.x  = q[0]
		self.grid_msg.info.origin.orientation.y  = q[1]
		self.grid_msg.info.origin.orientation.z  = q[2]
		self.grid_msg.info.origin.orientation.w  = q[3]
		self.grid_pub.publish(self.grid_msg)
		#rospy.loginfo(self.grid_msg)


if __name__ =="__main__":
   try:
      Maps()
      rospy.spin()
   except rospy.ROSInterruptException:
      pass
