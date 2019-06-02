// Generated by gencpp from file mapping/map_point.msg
// DO NOT EDIT!


#ifndef MAPPING_MESSAGE_MAP_POINT_H
#define MAPPING_MESSAGE_MAP_POINT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mapping
{
template <class ContainerAllocator>
struct map_point_
{
  typedef map_point_<ContainerAllocator> Type;

  map_point_()
    : a(0.0)
    , b(0.0)
    , x(0.0)
    , y(0.0)
    , theta(0.0)  {
    }
  map_point_(const ContainerAllocator& _alloc)
    : a(0.0)
    , b(0.0)
    , x(0.0)
    , y(0.0)
    , theta(0.0)  {
  (void)_alloc;
    }



   typedef float _a_type;
  _a_type a;

   typedef float _b_type;
  _b_type b;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _theta_type;
  _theta_type theta;





  typedef boost::shared_ptr< ::mapping::map_point_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mapping::map_point_<ContainerAllocator> const> ConstPtr;

}; // struct map_point_

typedef ::mapping::map_point_<std::allocator<void> > map_point;

typedef boost::shared_ptr< ::mapping::map_point > map_pointPtr;
typedef boost::shared_ptr< ::mapping::map_point const> map_pointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mapping::map_point_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mapping::map_point_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mapping

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'mapping': ['/home/phw/catkin_ws/src/tf_transform/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mapping::map_point_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mapping::map_point_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mapping::map_point_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mapping::map_point_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mapping::map_point_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mapping::map_point_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mapping::map_point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d336aba533752935417921278acaa543";
  }

  static const char* value(const ::mapping::map_point_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd336aba533752935ULL;
  static const uint64_t static_value2 = 0x417921278acaa543ULL;
};

template<class ContainerAllocator>
struct DataType< ::mapping::map_point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mapping/map_point";
  }

  static const char* value(const ::mapping::map_point_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mapping::map_point_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 a\n\
float32 b\n\
float32 x\n\
float32 y\n\
float32 theta\n\
";
  }

  static const char* value(const ::mapping::map_point_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mapping::map_point_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.a);
      stream.next(m.b);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.theta);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct map_point_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mapping::map_point_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mapping::map_point_<ContainerAllocator>& v)
  {
    s << indent << "a: ";
    Printer<float>::stream(s, indent + "  ", v.a);
    s << indent << "b: ";
    Printer<float>::stream(s, indent + "  ", v.b);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "theta: ";
    Printer<float>::stream(s, indent + "  ", v.theta);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAPPING_MESSAGE_MAP_POINT_H