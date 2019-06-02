// Generated by gencpp from file turtle_vis/DesiredPose.msg
// DO NOT EDIT!


#ifndef TURTLE_VIS_MESSAGE_DESIREDPOSE_H
#define TURTLE_VIS_MESSAGE_DESIREDPOSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace turtle_vis
{
template <class ContainerAllocator>
struct DesiredPose_
{
  typedef DesiredPose_<ContainerAllocator> Type;

  DesiredPose_()
    : x(0.0)
    , y(0.0)
    , theta(0.0)  {
    }
  DesiredPose_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , theta(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _theta_type;
  _theta_type theta;





  typedef boost::shared_ptr< ::turtle_vis::DesiredPose_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::turtle_vis::DesiredPose_<ContainerAllocator> const> ConstPtr;

}; // struct DesiredPose_

typedef ::turtle_vis::DesiredPose_<std::allocator<void> > DesiredPose;

typedef boost::shared_ptr< ::turtle_vis::DesiredPose > DesiredPosePtr;
typedef boost::shared_ptr< ::turtle_vis::DesiredPose const> DesiredPoseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::turtle_vis::DesiredPose_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::turtle_vis::DesiredPose_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace turtle_vis

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'turtle_vis': ['/home/phw/catkin_ws/src/turtle_vis/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::turtle_vis::DesiredPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::turtle_vis::DesiredPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::turtle_vis::DesiredPose_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::turtle_vis::DesiredPose_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::turtle_vis::DesiredPose_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::turtle_vis::DesiredPose_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::turtle_vis::DesiredPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "938fa65709584ad8e77d238529be13b8";
  }

  static const char* value(const ::turtle_vis::DesiredPose_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x938fa65709584ad8ULL;
  static const uint64_t static_value2 = 0xe77d238529be13b8ULL;
};

template<class ContainerAllocator>
struct DataType< ::turtle_vis::DesiredPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "turtle_vis/DesiredPose";
  }

  static const char* value(const ::turtle_vis::DesiredPose_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::turtle_vis::DesiredPose_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n\
float64 y\n\
float64 theta\n\
";
  }

  static const char* value(const ::turtle_vis::DesiredPose_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::turtle_vis::DesiredPose_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.theta);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DesiredPose_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::turtle_vis::DesiredPose_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::turtle_vis::DesiredPose_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "theta: ";
    Printer<double>::stream(s, indent + "  ", v.theta);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TURTLE_VIS_MESSAGE_DESIREDPOSE_H
