#!/home/rohan/projects/3py/bin/python

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc 

from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from pathlib import Path
import rospy

class GroundTruth:

	def __init__ (self,path):
			rospy.init_node("GroundTruth")

			self.marker = Marker()
			self.marker.header.frame_id = "imu_frame"
			self.marker.type = Marker.LINE_STRIP

			self.marker_pub = rospy.Publisher('Groundtruth_topic', Marker, queue_size=1)
			self.rate  = rospy.Rate(10)
			self.marker.scale.x = 0.03
			self.marker.scale.y = 0.03
			self.marker.scale.z = 0.03

			#marker color
			self.marker.color.a = 1.0
			self.marker.color.r = 1.0
			self.marker.color.g = 1.0
			self.marker.color.b = 0.0

			#marker orientaiton
			self.marker.pose.orientation.x = 0.0
			self.marker.pose.orientation.y = 0.0
			self.marker.pose.orientation.z = 0.0
			self.marker.pose.orientation.w = 1.0

			#marker position
			self.marker.pose.position.x = 0.0
			self.marker.pose.position.y = 0.0
			self.marker.pose.position.z = 0.0

			#markerpoint_list
			self.marker.points = []
			self.x = []
			self.y = []
			self.z = []

			data = Path(r"{}".format(path))
			with open(data, 'r') as data:
				data =  data.readlines()
				xy_array = ''.join(data).split()
				self.x = list(map(float,xy_array[0::2]))
				self.y = list(map(float,xy_array[1::2]))
				self.z = [0]*len(xy_array)

			for _x, _y, _z in zip(self.x, self.y, self.z):
					xyz = Point()
					xyz.x = _x
					xyz.y = _y
					xyz.z = _z
					self.marker.points.append(xyz)

			while not rospy.is_shutdown():
				self.marker_pub.publish(self.marker)
				self.rate.sleep()


if __name__ == "__main__":
      path = "/home/rohan/catkin_ws/src/pracs/txts/groundtruth_coordinates.txt";
      GroundTruth(path);
      rospy.spin() 

   

