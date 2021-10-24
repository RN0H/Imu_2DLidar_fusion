#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder


import rospy
from sensor_msgs.msg import LaserScan
import numpy as np
from math import sin,cos


class laser_publisher:
    def __init__ (self):
            rospy.init_node('laser_scan_publisher')
            self.scan_pub = rospy.Publisher("scan", LaserScan, queue_size =4)
            self.num_readings = 100
            self.laser_frequency = 40
            self.count = 0
            self.rate = rospy.Rate(50)                  #hz
            self.scan = LaserScan()
            self.scan.header.frame_id = 'laser_frame'
            self.scan.angle_min = -1.57
            self.scan.angle_max = 1.57
            self.scan.angle_increment = 3.14/self.num_readings
            self.scan.time_increment = (1.0 /self.laser_frequency/self.num_readings)
            self.scan.range_min = 0.0
            self.scan.range_max = 100.0


    def sample(self):
            while not rospy.is_shutdown():
                    self.scan.header.stamp = rospy.Time.now()
                    self.scan.ranges = []
                    self.scan.intensities = []
                    for i in range(self.num_readings):
                        self.scan.ranges.append(5)  # fake data
                        self.scan.intensities.append(np.random.randn())  # fake data
                    self.scan_pub.publish(self.scan)
                    self.rate.sleep()

if __name__ =="__main__":
   try:
      laser_publisher().sample()
   except rospy.ROSInterruptException:
      pass