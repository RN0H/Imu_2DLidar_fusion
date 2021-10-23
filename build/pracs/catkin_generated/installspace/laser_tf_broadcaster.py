#!/usr/bin/python

##!/home/rohan/projects/3py/bin/python3        (3PY)
#chmod +x $(file) for making it exec
#source ~/$(catkin_ws)/devel/setup.bash copy to bashrc   Note: only need to copy it once for all src under source folder


import rospy
import tf2_ros
import geometry_msgs.msg
from pracs.msg import mymsg
from tf.transformations import quaternion_from_euler

class laser_publisher:
    def __init__ (self):
            rospy.init_node('laser_scan_publisher')
            self.tf_br = tf2_ros.TransformBroadcaster()
            self.tf_msg = geometry_msgs.msg.TransformStamped()
            self.sub = rospy.Subscriber("imu", mymsg, self.sample)
    

    def sample(self,data):
                    self.tf_msg.header.stamp = rospy.Time.now()
                    self.tf_msg.header.frame_id = "imu_frame"
                    self.tf_msg.child_frame_id = "laser_frame"
                    self.tf_msg.transform.translation.x = data.x
                    self.tf_msg.transform.translation.y = data.y
                    self.tf_msg.transform.translation.z = data.z
                    quat = quaternion_from_euler(data.roll, data.yaw, data.pitch)
                    self.tf_msg.transform.rotation.x = quat[0]
                    self.tf_msg.transform.rotation.y = quat[1]
                    self.tf_msg.transform.rotation.z = quat[2]
                    self.tf_msg.transform.rotation.w = quat[3]
                    self.tf_br.sendTransform(self.tf_msg)
                   

if __name__ =="__main__":
   try:
      laser_publisher()
      rospy.spin()
   except rospy.ROSInterruptException:
      pass