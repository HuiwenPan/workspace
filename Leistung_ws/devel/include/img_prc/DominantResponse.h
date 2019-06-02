// Generated by gencpp from file img_prc/DominantResponse.msg
// DO NOT EDIT!


#ifndef IMG_PRC_MESSAGE_DOMINANTRESPONSE_H
#define IMG_PRC_MESSAGE_DOMINANTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>

namespace img_prc
{
template <class ContainerAllocator>
struct DominantResponse_
{
  typedef DominantResponse_<ContainerAllocator> Type;

  DominantResponse_()
    : img_dom()  {
    }
  DominantResponse_(const ContainerAllocator& _alloc)
    : img_dom(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _img_dom_type;
  _img_dom_type img_dom;





  typedef boost::shared_ptr< ::img_prc::DominantResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::img_prc::DominantResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DominantResponse_

typedef ::img_prc::DominantResponse_<std::allocator<void> > DominantResponse;

typedef boost::shared_ptr< ::img_prc::DominantResponse > DominantResponsePtr;
typedef boost::shared_ptr< ::img_prc::DominantResponse const> DominantResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::img_prc::DominantResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::img_prc::DominantResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace img_prc

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg', '/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::img_prc::DominantResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::img_prc::DominantResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::img_prc::DominantResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::img_prc::DominantResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::img_prc::DominantResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::img_prc::DominantResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::img_prc::DominantResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4d64d29ddf4914c31c805bbbc0809b5e";
  }

  static const char* value(const ::img_prc::DominantResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4d64d29ddf4914c3ULL;
  static const uint64_t static_value2 = 0x1c805bbbc0809b5eULL;
};

template<class ContainerAllocator>
struct DataType< ::img_prc::DominantResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "img_prc/DominantResponse";
  }

  static const char* value(const ::img_prc::DominantResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::img_prc::DominantResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/Image img_dom\n\
\n\
\n\
================================================================================\n\
MSG: sensor_msgs/Image\n\
# This message contains an uncompressed image\n\
# (0, 0) is at top-left corner of image\n\
#\n\
\n\
Header header        # Header timestamp should be acquisition time of image\n\
                     # Header frame_id should be optical frame of camera\n\
                     # origin of frame should be optical center of cameara\n\
                     # +x should point to the right in the image\n\
                     # +y should point down in the image\n\
                     # +z should point into to plane of the image\n\
                     # If the frame_id here and the frame_id of the CameraInfo\n\
                     # message associated with the image conflict\n\
                     # the behavior is undefined\n\
\n\
uint32 height         # image height, that is, number of rows\n\
uint32 width          # image width, that is, number of columns\n\
\n\
# The legal values for encoding are in file src/image_encodings.cpp\n\
# If you want to standardize a new string format, join\n\
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n\
\n\
string encoding       # Encoding of pixels -- channel meaning, ordering, size\n\
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n\
\n\
uint8 is_bigendian    # is this data bigendian?\n\
uint32 step           # Full row length in bytes\n\
uint8[] data          # actual matrix data, size is (step * rows)\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::img_prc::DominantResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::img_prc::DominantResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.img_dom);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DominantResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::img_prc::DominantResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::img_prc::DominantResponse_<ContainerAllocator>& v)
  {
    s << indent << "img_dom: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.img_dom);
  }
};

} // namespace message_operations
} // namespace ros

#endif // IMG_PRC_MESSAGE_DOMINANTRESPONSE_H
