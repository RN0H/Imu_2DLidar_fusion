// Generated by gencpp from file pracs/fuse.msg
// DO NOT EDIT!


#ifndef PRACS_MESSAGE_FUSE_H
#define PRACS_MESSAGE_FUSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace pracs
{
template <class ContainerAllocator>
struct fuse_
{
  typedef fuse_<ContainerAllocator> Type;

  fuse_()
    : header()
    , x()
    , y()
    , z()
    , roll()
    , yaw()
    , pitch()
    , ranges()  {
    }
  fuse_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , x(_alloc)
    , y(_alloc)
    , z(_alloc)
    , roll(_alloc)
    , yaw(_alloc)
    , pitch(_alloc)
    , ranges(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _x_type;
  _x_type x;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _y_type;
  _y_type y;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _z_type;
  _z_type z;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _roll_type;
  _roll_type roll;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _yaw_type;
  _yaw_type yaw;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _pitch_type;
  _pitch_type pitch;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _ranges_type;
  _ranges_type ranges;





  typedef boost::shared_ptr< ::pracs::fuse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pracs::fuse_<ContainerAllocator> const> ConstPtr;

}; // struct fuse_

typedef ::pracs::fuse_<std::allocator<void> > fuse;

typedef boost::shared_ptr< ::pracs::fuse > fusePtr;
typedef boost::shared_ptr< ::pracs::fuse const> fuseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pracs::fuse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pracs::fuse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::pracs::fuse_<ContainerAllocator1> & lhs, const ::pracs::fuse_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.roll == rhs.roll &&
    lhs.yaw == rhs.yaw &&
    lhs.pitch == rhs.pitch &&
    lhs.ranges == rhs.ranges;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::pracs::fuse_<ContainerAllocator1> & lhs, const ::pracs::fuse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace pracs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::pracs::fuse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pracs::fuse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pracs::fuse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pracs::fuse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pracs::fuse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pracs::fuse_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pracs::fuse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "928b9f2c3ffde350158f693508e3c987";
  }

  static const char* value(const ::pracs::fuse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x928b9f2c3ffde350ULL;
  static const uint64_t static_value2 = 0x158f693508e3c987ULL;
};

template<class ContainerAllocator>
struct DataType< ::pracs::fuse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pracs/fuse";
  }

  static const char* value(const ::pracs::fuse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pracs::fuse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#class $(file_name):\n"
"#          type file_name.attr1 = var_name1\n"
"#		   type file_name.attr2 = var_name2\n"
"\n"
"\n"
"#rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading\n"
"#rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw\n"
"#echo \"field type variable\" > msg/$(FILE.msg)       ##For Writing \n"
"\n"
"#AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg\n"
"#FIELD_TYPE VARIABLE Format\n"
"\n"
"Header header		#seq, time_stamp, id\n"
"float64[] x\n"
"float64[] y\n"
"float64[] z\n"
"\n"
"float64[] roll\n"
"float64[] yaw\n"
"float64[] pitch\n"
"\n"
"float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::pracs::fuse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pracs::fuse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.roll);
      stream.next(m.yaw);
      stream.next(m.pitch);
      stream.next(m.ranges);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct fuse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pracs::fuse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pracs::fuse_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "x[]" << std::endl;
    for (size_t i = 0; i < v.x.size(); ++i)
    {
      s << indent << "  x[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.x[i]);
    }
    s << indent << "y[]" << std::endl;
    for (size_t i = 0; i < v.y.size(); ++i)
    {
      s << indent << "  y[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.y[i]);
    }
    s << indent << "z[]" << std::endl;
    for (size_t i = 0; i < v.z.size(); ++i)
    {
      s << indent << "  z[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.z[i]);
    }
    s << indent << "roll[]" << std::endl;
    for (size_t i = 0; i < v.roll.size(); ++i)
    {
      s << indent << "  roll[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.roll[i]);
    }
    s << indent << "yaw[]" << std::endl;
    for (size_t i = 0; i < v.yaw.size(); ++i)
    {
      s << indent << "  yaw[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.yaw[i]);
    }
    s << indent << "pitch[]" << std::endl;
    for (size_t i = 0; i < v.pitch.size(); ++i)
    {
      s << indent << "  pitch[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.pitch[i]);
    }
    s << indent << "ranges[]" << std::endl;
    for (size_t i = 0; i < v.ranges.size(); ++i)
    {
      s << indent << "  ranges[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.ranges[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PRACS_MESSAGE_FUSE_H
