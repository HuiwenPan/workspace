// Generated by gencpp from file img_prc/Negbild.msg
// DO NOT EDIT!


#ifndef IMG_PRC_MESSAGE_NEGBILD_H
#define IMG_PRC_MESSAGE_NEGBILD_H

#include <ros/service_traits.h>


#include <img_prc/NegbildRequest.h>
#include <img_prc/NegbildResponse.h>


namespace img_prc
{

struct Negbild
{

typedef NegbildRequest Request;
typedef NegbildResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Negbild
} // namespace img_prc


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::img_prc::Negbild > {
  static const char* value()
  {
    return "862fde1277655a70d749518de66ecb5b";
  }

  static const char* value(const ::img_prc::Negbild&) { return value(); }
};

template<>
struct DataType< ::img_prc::Negbild > {
  static const char* value()
  {
    return "img_prc/Negbild";
  }

  static const char* value(const ::img_prc::Negbild&) { return value(); }
};


// service_traits::MD5Sum< ::img_prc::NegbildRequest> should match 
// service_traits::MD5Sum< ::img_prc::Negbild > 
template<>
struct MD5Sum< ::img_prc::NegbildRequest>
{
  static const char* value()
  {
    return MD5Sum< ::img_prc::Negbild >::value();
  }
  static const char* value(const ::img_prc::NegbildRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::img_prc::NegbildRequest> should match 
// service_traits::DataType< ::img_prc::Negbild > 
template<>
struct DataType< ::img_prc::NegbildRequest>
{
  static const char* value()
  {
    return DataType< ::img_prc::Negbild >::value();
  }
  static const char* value(const ::img_prc::NegbildRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::img_prc::NegbildResponse> should match 
// service_traits::MD5Sum< ::img_prc::Negbild > 
template<>
struct MD5Sum< ::img_prc::NegbildResponse>
{
  static const char* value()
  {
    return MD5Sum< ::img_prc::Negbild >::value();
  }
  static const char* value(const ::img_prc::NegbildResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::img_prc::NegbildResponse> should match 
// service_traits::DataType< ::img_prc::Negbild > 
template<>
struct DataType< ::img_prc::NegbildResponse>
{
  static const char* value()
  {
    return DataType< ::img_prc::Negbild >::value();
  }
  static const char* value(const ::img_prc::NegbildResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // IMG_PRC_MESSAGE_NEGBILD_H