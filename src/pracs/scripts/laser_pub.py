#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder


import rospy
from sensor_msgs.msg import LaserScan
import numpy as np
from math import sin,cos
import math


class laser_publisher:
    def __init__ (self):
            rospy.init_node('laser_scan_publisher')
            self.scan_pub = rospy.Publisher("scan", LaserScan, queue_size =4)
            self.ls1 =  [1, 0.79, 0.707, 0.79, 1, 0.79, 0.707, 0.79, 1, 0.79, 0.707, 0.79, 1, 0.79, 0.707, 0.79, 1]     
            self.ls2 =  [i for i in [0.707, 0.79, 1, 0.79, 0.707, 0.79, 1, 0.79, 0.707, 0.79, 1, 0.79, 0.707, 0.79, 1, 0.79, 0.707]]
            self.num_readings = 17
            self.laser_frequency = 40
            self.count = 0
            self.rate = rospy.Rate(1)                  #hz
            self.scan = LaserScan()
            self.scan.header.frame_id = 'laser_frame'
            self.scan.angle_min = -1.57
            self.scan.angle_max = 1.57
            self.scan.angle_increment = 3.14/self.num_readings
            self.scan.time_increment = (1.0 /self.laser_frequency/self.num_readings)
            self.scan.range_min = 0.0
            self.scan.range_max = 100.0
            self.f = 0 



    def sample(self):
            while not rospy.is_shutdown():
                    self.scan.header.stamp = rospy.Time.now()
                    # if self.count == 500:
                    self.scan.ranges = []
                    self.scan.intensities = []
                    self.count = 0
                    if self.f:
                        self.scan.ranges.extend(self.ls2)
                        self.f = 0
                    else:
                        self.scan.ranges.extend(self.ls1)
                        self.f = 1
                    # for i in range(self.num_readings):
                    #     self.scan.ranges.append(sin(math.radians(i)))  # fake data
                    #     self.scan.intensities.append(np.random.randn())  # fake data
                    self.scan_pub.publish(self.scan)
                    #self.count+=1
                    self.rate.sleep()

if __name__ =="__main__":
   try:
      laser_publisher().sample()
   except rospy.ROSInterruptException:
      pass