// Generated by gencpp from file tiago_control/send_desired_poseResponse.msg
// DO NOT EDIT!


#ifndef TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSERESPONSE_H
#define TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tiago_control
{
template <class ContainerAllocator>
struct send_desired_poseResponse_
{
  typedef send_desired_poseResponse_<ContainerAllocator> Type;

  send_desired_poseResponse_()
    : reply(false)  {
    }
  send_desired_poseResponse_(const ContainerAllocator& _alloc)
    : reply(false)  {
  (void)_alloc;
    }



   typedef uint8_t _reply_type;
  _reply_type reply;





  typedef boost::shared_ptr< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> const> ConstPtr;

}; // struct send_desired_poseResponse_

typedef ::tiago_control::send_desired_poseResponse_<std::allocator<void> > send_desired_poseResponse;

typedef boost::shared_ptr< ::tiago_control::send_desired_poseResponse > send_desired_poseResponsePtr;
typedef boost::shared_ptr< ::tiago_control::send_desired_poseResponse const> send_desired_poseResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tiago_control::send_desired_poseResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tiago_control

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'tiago_control': ['/home/phw/workspace/roboCupHome/src/tiago_control/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "06d4f276c51f7469624c6fbcbf0e7869";
  }

  static const char* value(const ::tiago_control::send_desired_poseResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x06d4f276c51f7469ULL;
  static const uint64_t static_value2 = 0x624c6fbcbf0e7869ULL;
};

template<class ContainerAllocator>
struct DataType< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tiago_control/send_desired_poseResponse";
  }

  static const char* value(const ::tiago_control::send_desired_poseResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
bool reply\n\
\n\
";
  }

  static const char* value(const ::tiago_control::send_desired_poseResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.reply);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct send_desired_poseResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tiago_control::send_desired_poseResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tiago_control::send_desired_poseResponse_<ContainerAllocator>& v)
  {
    s << indent << "reply: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.reply);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSERESPONSE_H
