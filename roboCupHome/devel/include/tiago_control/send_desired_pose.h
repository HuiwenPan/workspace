// Generated by gencpp from file tiago_control/send_desired_pose.msg
// DO NOT EDIT!


#ifndef TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSE_H
#define TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSE_H

#include <ros/service_traits.h>


#include <tiago_control/send_desired_poseRequest.h>
#include <tiago_control/send_desired_poseResponse.h>


namespace tiago_control
{

struct send_desired_pose
{

typedef send_desired_poseRequest Request;
typedef send_desired_poseResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct send_desired_pose
} // namespace tiago_control


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tiago_control::send_desired_pose > {
  static const char* value()
  {
    return "92cc19f774a1a08ab88aade5806448d9";
  }

  static const char* value(const ::tiago_control::send_desired_pose&) { return value(); }
};

template<>
struct DataType< ::tiago_control::send_desired_pose > {
  static const char* value()
  {
    return "tiago_control/send_desired_pose";
  }

  static const char* value(const ::tiago_control::send_desired_pose&) { return value(); }
};


// service_traits::MD5Sum< ::tiago_control::send_desired_poseRequest> should match 
// service_traits::MD5Sum< ::tiago_control::send_desired_pose > 
template<>
struct MD5Sum< ::tiago_control::send_desired_poseRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tiago_control::send_desired_pose >::value();
  }
  static const char* value(const ::tiago_control::send_desired_poseRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tiago_control::send_desired_poseRequest> should match 
// service_traits::DataType< ::tiago_control::send_desired_pose > 
template<>
struct DataType< ::tiago_control::send_desired_poseRequest>
{
  static const char* value()
  {
    return DataType< ::tiago_control::send_desired_pose >::value();
  }
  static const char* value(const ::tiago_control::send_desired_poseRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tiago_control::send_desired_poseResponse> should match 
// service_traits::MD5Sum< ::tiago_control::send_desired_pose > 
template<>
struct MD5Sum< ::tiago_control::send_desired_poseResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tiago_control::send_desired_pose >::value();
  }
  static const char* value(const ::tiago_control::send_desired_poseResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tiago_control::send_desired_poseResponse> should match 
// service_traits::DataType< ::tiago_control::send_desired_pose > 
template<>
struct DataType< ::tiago_control::send_desired_poseResponse>
{
  static const char* value()
  {
    return DataType< ::tiago_control::send_desired_pose >::value();
  }
  static const char* value(const ::tiago_control::send_desired_poseResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TIAGO_CONTROL_MESSAGE_SEND_DESIRED_POSE_H
