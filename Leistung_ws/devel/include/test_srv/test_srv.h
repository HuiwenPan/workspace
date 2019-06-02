// Generated by gencpp from file test_srv/test_srv.msg
// DO NOT EDIT!


#ifndef TEST_SRV_MESSAGE_TEST_SRV_H
#define TEST_SRV_MESSAGE_TEST_SRV_H

#include <ros/service_traits.h>


#include <test_srv/test_srvRequest.h>
#include <test_srv/test_srvResponse.h>


namespace test_srv
{

struct test_srv
{

typedef test_srvRequest Request;
typedef test_srvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct test_srv
} // namespace test_srv


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::test_srv::test_srv > {
  static const char* value()
  {
    return "9cc62145209219f185101e72e3ae5c65";
  }

  static const char* value(const ::test_srv::test_srv&) { return value(); }
};

template<>
struct DataType< ::test_srv::test_srv > {
  static const char* value()
  {
    return "test_srv/test_srv";
  }

  static const char* value(const ::test_srv::test_srv&) { return value(); }
};


// service_traits::MD5Sum< ::test_srv::test_srvRequest> should match 
// service_traits::MD5Sum< ::test_srv::test_srv > 
template<>
struct MD5Sum< ::test_srv::test_srvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::test_srv::test_srv >::value();
  }
  static const char* value(const ::test_srv::test_srvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::test_srv::test_srvRequest> should match 
// service_traits::DataType< ::test_srv::test_srv > 
template<>
struct DataType< ::test_srv::test_srvRequest>
{
  static const char* value()
  {
    return DataType< ::test_srv::test_srv >::value();
  }
  static const char* value(const ::test_srv::test_srvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::test_srv::test_srvResponse> should match 
// service_traits::MD5Sum< ::test_srv::test_srv > 
template<>
struct MD5Sum< ::test_srv::test_srvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::test_srv::test_srv >::value();
  }
  static const char* value(const ::test_srv::test_srvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::test_srv::test_srvResponse> should match 
// service_traits::DataType< ::test_srv::test_srv > 
template<>
struct DataType< ::test_srv::test_srvResponse>
{
  static const char* value()
  {
    return DataType< ::test_srv::test_srv >::value();
  }
  static const char* value(const ::test_srv::test_srvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TEST_SRV_MESSAGE_TEST_SRV_H
