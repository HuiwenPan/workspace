// Generated by gencpp from file qt_connection/AbRatio.msg
// DO NOT EDIT!


#ifndef QT_CONNECTION_MESSAGE_ABRATIO_H
#define QT_CONNECTION_MESSAGE_ABRATIO_H

#include <ros/service_traits.h>


#include <qt_connection/AbRatioRequest.h>
#include <qt_connection/AbRatioResponse.h>


namespace qt_connection
{

struct AbRatio
{

typedef AbRatioRequest Request;
typedef AbRatioResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct AbRatio
} // namespace qt_connection


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::qt_connection::AbRatio > {
  static const char* value()
  {
    return "61c5d5487d6721936edcd8f3bcc6605b";
  }

  static const char* value(const ::qt_connection::AbRatio&) { return value(); }
};

template<>
struct DataType< ::qt_connection::AbRatio > {
  static const char* value()
  {
    return "qt_connection/AbRatio";
  }

  static const char* value(const ::qt_connection::AbRatio&) { return value(); }
};


// service_traits::MD5Sum< ::qt_connection::AbRatioRequest> should match 
// service_traits::MD5Sum< ::qt_connection::AbRatio > 
template<>
struct MD5Sum< ::qt_connection::AbRatioRequest>
{
  static const char* value()
  {
    return MD5Sum< ::qt_connection::AbRatio >::value();
  }
  static const char* value(const ::qt_connection::AbRatioRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::qt_connection::AbRatioRequest> should match 
// service_traits::DataType< ::qt_connection::AbRatio > 
template<>
struct DataType< ::qt_connection::AbRatioRequest>
{
  static const char* value()
  {
    return DataType< ::qt_connection::AbRatio >::value();
  }
  static const char* value(const ::qt_connection::AbRatioRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::qt_connection::AbRatioResponse> should match 
// service_traits::MD5Sum< ::qt_connection::AbRatio > 
template<>
struct MD5Sum< ::qt_connection::AbRatioResponse>
{
  static const char* value()
  {
    return MD5Sum< ::qt_connection::AbRatio >::value();
  }
  static const char* value(const ::qt_connection::AbRatioResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::qt_connection::AbRatioResponse> should match 
// service_traits::DataType< ::qt_connection::AbRatio > 
template<>
struct DataType< ::qt_connection::AbRatioResponse>
{
  static const char* value()
  {
    return DataType< ::qt_connection::AbRatio >::value();
  }
  static const char* value(const ::qt_connection::AbRatioResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // QT_CONNECTION_MESSAGE_ABRATIO_H