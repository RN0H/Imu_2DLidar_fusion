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


    def sample(self):
            while not rospy.is_shutdown():
                    current_time = rospy.Time.now()
                    scan = LaserScan()
                    scan.header.stamp = current_time
                    scan.header.frame_id = 'laser_frame'
                    scan.angle_min = -1.57
                    scan.angle_max = 1.57
                    scan.angle_increment = 3.14/self.num_readings
                    scan.time_increment = (1.0 /self.laser_frequency/self.num_readings)
                    scan.range_min = 0.0
                    scan.range_max = 100.0
                    scan.ranges = []
                    scan.intensities = []
                    for i in range(self.num_readings):
                        scan.ranges.append(5)  # fake data
                        scan.intensities.append(np.random.randn())  # fake data
                    self.scan_pub.publish(scan)
                    self.count += 1
                    self.rate.sleep()

if __name__ =="__main__":
   try:
      laser_publisher().sample()
   except rospy.ROSInterruptException:
      pass