// Generated by gencpp from file img_prc/Kanten.msg
// DO NOT EDIT!


#ifndef IMG_PRC_MESSAGE_KANTEN_H
#define IMG_PRC_MESSAGE_KANTEN_H

#include <ros/service_traits.h>


#include <img_prc/KantenRequest.h>
#include <img_prc/KantenResponse.h>


namespace img_prc
{

struct Kanten
{

typedef KantenRequest Request;
typedef KantenResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Kanten
} // namespace img_prc


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::img_prc::Kanten > {
  static const char* value()
  {
    return "8d2de0cb4df39c8a7c1e5d0934f5dd6b";
  }

  static const char* value(const ::img_prc::Kanten&) { return value(); }
};

template<>
struct DataType< ::img_prc::Kanten > {
  static const char* value()
  {
    return "img_prc/Kanten";
  }

  static const char* value(const ::img_prc::Kanten&) { return value(); }
};


// service_traits::MD5Sum< ::img_prc::KantenRequest> should match 
// service_traits::MD5Sum< ::img_prc::Kanten > 
template<>
struct MD5Sum< ::img_prc::KantenRequest>
{
  static const char* value()
  {
    return MD5Sum< ::img_prc::Kanten >::value();
  }
  static const char* value(const ::img_prc::KantenRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::img_prc::KantenRequest> should match 
// service_traits::DataType< ::img_prc::Kanten > 
template<>
struct DataType< ::img_prc::KantenRequest>
{
  static const char* value()
  {
    return DataType< ::img_prc::Kanten >::value();
  }
  static const char* value(const ::img_prc::KantenRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::img_prc::KantenResponse> should match 
// service_traits::MD5Sum< ::img_prc::Kanten > 
template<>
struct MD5Sum< ::img_prc::KantenResponse>
{
  static const char* value()
  {
    return MD5Sum< ::img_prc::Kanten >::value();
  }
  static const char* value(const ::img_prc::KantenResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::img_prc::KantenResponse> should match 
// service_traits::DataType< ::img_prc::Kanten > 
template<>
struct DataType< ::img_prc::KantenResponse>
{
  static const char* value()
  {
    return DataType< ::img_prc::Kanten >::value();
  }
  static const char* value(const ::img_prc::KantenResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // IMG_PRC_MESSAGE_KANTEN_H