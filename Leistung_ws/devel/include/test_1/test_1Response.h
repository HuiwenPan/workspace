// Generated by gencpp from file test_1/test_1Response.msg
// DO NOT EDIT!


#ifndef TEST_1_MESSAGE_TEST_1RESPONSE_H
#define TEST_1_MESSAGE_TEST_1RESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>

namespace test_1
{
template <class ContainerAllocator>
struct test_1Response_
{
  typedef test_1Response_<ContainerAllocator> Type;

  test_1Response_()
    : output_text()
    , output(0)  {
    }
  test_1Response_(const ContainerAllocator& _alloc)
    : output_text(_alloc)
    , output(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::String_<ContainerAllocator>  _output_text_type;
  _output_text_type output_text;

   typedef int64_t _output_type;
  _output_type output;





  typedef boost::shared_ptr< ::test_1::test_1Response_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_1::test_1Response_<ContainerAllocator> const> ConstPtr;

}; // struct test_1Response_

typedef ::test_1::test_1Response_<std::allocator<void> > test_1Response;

typedef boost::shared_ptr< ::test_1::test_1Response > test_1ResponsePtr;
typedef boost::shared_ptr< ::test_1::test_1Response const> test_1ResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_1::test_1Response_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_1::test_1Response_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace test_1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::test_1::test_1Response_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_1::test_1Response_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_1::test_1Response_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_1::test_1Response_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_1::test_1Response_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_1::test_1Response_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_1::test_1Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d3c622429dd44cd796ab2bce4ea56cf9";
  }

  static const char* value(const ::test_1::test_1Response_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd3c622429dd44cd7ULL;
  static const uint64_t static_value2 = 0x96ab2bce4ea56cf9ULL;
};

template<class ContainerAllocator>
struct DataType< ::test_1::test_1Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_1/test_1Response";
  }

  static const char* value(const ::test_1::test_1Response_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_1::test_1Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/String output_text\n\
int64       output\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
";
  }

  static const char* value(const ::test_1::test_1Response_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_1::test_1Response_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output_text);
      stream.next(m.output);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct test_1Response_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_1::test_1Response_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_1::test_1Response_<ContainerAllocator>& v)
  {
    s << indent << "output_text: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.output_text);
    s << indent << "output: ";
    Printer<int64_t>::stream(s, indent + "  ", v.output);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_1_MESSAGE_TEST_1RESPONSE_H
