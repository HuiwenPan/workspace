// Generated by gencpp from file move_control/DesiredPose.msg
// DO NOT EDIT!


#ifndef MOVE_CONTROL_MESSAGE_DESIREDPOSE_H
#define MOVE_CONTROL_MESSAGE_DESIREDPOSE_H

#include <ros/service_traits.h>


#include <move_control/DesiredPoseRequest.h>
#include <move_control/DesiredPoseResponse.h>


namespace move_control
{

struct DesiredPose
{

typedef DesiredPoseRequest Request;
typedef DesiredPoseResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct DesiredPose
} // namespace move_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::move_control::DesiredPose > {
  static const char* value()
  {
    return "0a875362d8b56b739c21258a4954ddeb";
  }

  static const char* value(const ::move_control::DesiredPose&) { return value(); }
};

template<>
struct DataType< ::move_control::DesiredPose > {
  static const char* value()
  {
    return "move_control/DesiredPose";
  }

  static const char* value(const ::move_control::DesiredPose&) { return value(); }
};


// service_traits::MD5Sum< ::move_control::DesiredPoseRequest> should match 
// service_traits::MD5Sum< ::move_control::DesiredPose > 
template<>
struct MD5Sum< ::move_control::DesiredPoseRequest>
{
  static const char* value()
  {
    return MD5Sum< ::move_control::DesiredPose >::value();
  }
  static const char* value(const ::move_control::DesiredPoseRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::move_control::DesiredPoseRequest> should match 
// service_traits::DataType< ::move_control::DesiredPose > 
template<>
struct DataType< ::move_control::DesiredPoseRequest>
{
  static const char* value()
  {
    return DataType< ::move_control::DesiredPose >::value();
  }
  static const char* value(const ::move_control::DesiredPoseRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::move_control::DesiredPoseResponse> should match 
// service_traits::MD5Sum< ::move_control::DesiredPose > 
template<>
struct MD5Sum< ::move_control::DesiredPoseResponse>
{
  static const char* value()
  {
    return MD5Sum< ::move_control::DesiredPose >::value();
  }
  static const char* value(const ::move_control::DesiredPoseResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::move_control::DesiredPoseResponse> should match 
// service_traits::DataType< ::move_control::DesiredPose > 
template<>
struct DataType< ::move_control::DesiredPoseResponse>
{
  static const char* value()
  {
    return DataType< ::move_control::DesiredPose >::value();
  }
  static const char* value(const ::move_control::DesiredPoseResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MOVE_CONTROL_MESSAGE_DESIREDPOSE_H