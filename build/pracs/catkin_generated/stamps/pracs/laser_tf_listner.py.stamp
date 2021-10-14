#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder



import rospy
import tf2_ros
import geometry_msgs.msg
from math import sin,cos

class Dynamic_tf_broadcaster:
   
      def __init__ (self):
         self.tf_msg = geometry_msgs.msg.TransformStamped()
         rospy.init_node('laser_tf_listner')
         self.Buffer = tf2_ros.Buffer()
         self.listener = tf2_ros.TransformListener(self.Buffer)
         self.rate = rospy.Rate(50)

      def sample(self):
          while not rospy.is_shutdown():
               try:
                  self.Buffer.lookup_transform("imu_frame", "laser_frame",rospy.Time())
               except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                     pass
               self.rate.sleep()
      

if __name__ =="__main__":
   try:
      Dynamic_tf_broadcaster().sample()
   except rospy.ROSInterruptException:
      pass

