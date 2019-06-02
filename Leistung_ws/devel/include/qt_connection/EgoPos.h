// Generated by gencpp from file qt_connection/EgoPos.msg
// DO NOT EDIT!


#ifndef QT_CONNECTION_MESSAGE_EGOPOS_H
#define QT_CONNECTION_MESSAGE_EGOPOS_H

#include <ros/service_traits.h>


#include <qt_connection/EgoPosRequest.h>
#include <qt_connection/EgoPosResponse.h>


namespace qt_connection
{

struct EgoPos
{

typedef EgoPosRequest Request;
typedef EgoPosResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct EgoPos
} // namespace qt_connection


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::qt_connection::EgoPos > {
  static const char* value()
  {
    return "c0407d004a1efa7e56d28b80616e7c3e";
  }

  static const char* value(const ::qt_connection::EgoPos&) { return value(); }
};

template<>
struct DataType< ::qt_connection::EgoPos > {
  static const char* value()
  {
    return "qt_connection/EgoPos";
  }

  static const char* value(const ::qt_connection::EgoPos&) { return value(); }
};


// service_traits::MD5Sum< ::qt_connection::EgoPosRequest> should match 
// service_traits::MD5Sum< ::qt_connection::EgoPos > 
template<>
struct MD5Sum< ::qt_connection::EgoPosRequest>
{
  static const char* value()
  {
    return MD5Sum< ::qt_connection::EgoPos >::value();
  }
  static const char* value(const ::qt_connection::EgoPosRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::qt_connection::EgoPosRequest> should match 
// service_traits::DataType< ::qt_connection::EgoPos > 
template<>
struct DataType< ::qt_connection::EgoPosRequest>
{
  static const char* value()
  {
    return DataType< ::qt_connection::EgoPos >::value();
  }
  static const char* value(const ::qt_connection::EgoPosRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::qt_connection::EgoPosResponse> should match 
// service_traits::MD5Sum< ::qt_connection::EgoPos > 
template<>
struct MD5Sum< ::qt_connection::EgoPosResponse>
{
  static const char* value()
  {
    return MD5Sum< ::qt_connection::EgoPos >::value();
  }
  static const char* value(const ::qt_connection::EgoPosResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::qt_connection::EgoPosResponse> should match 
// service_traits::DataType< ::qt_connection::EgoPos > 
template<>
struct DataType< ::qt_connection::EgoPosResponse>
{
  static const char* value()
  {
    return DataType< ::qt_connection::EgoPos >::value();
  }
  static const char* value(const ::qt_connection::EgoPosResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // QT_CONNECTION_MESSAGE_EGOPOS_H
