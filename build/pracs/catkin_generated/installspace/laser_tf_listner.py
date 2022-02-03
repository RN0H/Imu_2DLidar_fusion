#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python    (3py)

#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder



import rospy
import tf2_ros
import geometry_msgs.msg
from pracs.msg import mymsg
from math import sin,cos

class Dynamic_tf_broadcaster:
   
      def __init__ (self):
         self.tf_msg = geometry_msgs.msg.TransformStamped()
         rospy.init_node('laser_tf_listner')

         self.tf_pub = rospy.Publisher("BunchOfPoses", mymsg, queue_size = 4)
         self.tf_msg_pub = mymsg()

         self.Buffer = tf2_ros.Buffer()
         self.listener = tf2_ros.TransformListener(self.Buffer)
         self.rate = rospy.Rate(50)

      def sample(self):
          while not rospy.is_shutdown():
               try:
                  msg = self.Buffer.lookup_transform("imu_frame", "laser_frame",rospy.Time.now(), rospy.Duration(0.02))
                  self.tf_msg_pub.x = msg.transform.translation.x
                  self.tf_msg_pub.y = msg.transform.translation.y
                  self.tf_msg_pub.z = msg.transform.translation.z

                  self.tf_msg_pub.roll = msg.transform.rotation.x
                  self.tf_msg_pub.pitch =msg.transform.rotation.y
                  self.tf_msg_pub.yaw = msg.transform.rotation.z

                  self.tf_pub.publish(self.tf_msg_pub)
               except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                     pass
               self.rate.sleep()
      

if __name__ =="__main__":
   try:
      Dynamic_tf_broadcaster().sample()
   except rospy.ROSInterruptException:
      pass

