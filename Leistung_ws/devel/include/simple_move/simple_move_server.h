// Generated by gencpp from file simple_move/simple_move_server.msg
// DO NOT EDIT!


#ifndef SIMPLE_MOVE_MESSAGE_SIMPLE_MOVE_SERVER_H
#define SIMPLE_MOVE_MESSAGE_SIMPLE_MOVE_SERVER_H

#include <ros/service_traits.h>


#include <simple_move/simple_move_serverRequest.h>
#include <simple_move/simple_move_serverResponse.h>


namespace simple_move
{

struct simple_move_server
{

typedef simple_move_serverRequest Request;
typedef simple_move_serverResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct simple_move_server
} // namespace simple_move


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::simple_move::simple_move_server > {
  static const char* value()
  {
    return "05a3b190b2a3e8da10e3d0069fe74dbc";
  }

  static const char* value(const ::simple_move::simple_move_server&) { return value(); }
};

template<>
struct DataType< ::simple_move::simple_move_server > {
  static const char* value()
  {
    return "simple_move/simple_move_server";
  }

  static const char* value(const ::simple_move::simple_move_server&) { return value(); }
};


// service_traits::MD5Sum< ::simple_move::simple_move_serverRequest> should match 
// service_traits::MD5Sum< ::simple_move::simple_move_server > 
template<>
struct MD5Sum< ::simple_move::simple_move_serverRequest>
{
  static const char* value()
  {
    return MD5Sum< ::simple_move::simple_move_server >::value();
  }
  static const char* value(const ::simple_move::simple_move_serverRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::simple_move::simple_move_serverRequest> should match 
// service_traits::DataType< ::simple_move::simple_move_server > 
template<>
struct DataType< ::simple_move::simple_move_serverRequest>
{
  static const char* value()
  {
    return DataType< ::simple_move::simple_move_server >::value();
  }
  static const char* value(const ::simple_move::simple_move_serverRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::simple_move::simple_move_serverResponse> should match 
// service_traits::MD5Sum< ::simple_move::simple_move_server > 
template<>
struct MD5Sum< ::simple_move::simple_move_serverResponse>
{
  static const char* value()
  {
    return MD5Sum< ::simple_move::simple_move_server >::value();
  }
  static const char* value(const ::simple_move::simple_move_serverResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::simple_move::simple_move_serverResponse> should match 
// service_traits::DataType< ::simple_move::simple_move_server > 
template<>
struct DataType< ::simple_move::simple_move_serverResponse>
{
  static const char* value()
  {
    return DataType< ::simple_move::simple_move_server >::value();
  }
  static const char* value(const ::simple_move::simple_move_serverResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SIMPLE_MOVE_MESSAGE_SIMPLE_MOVE_SERVER_H
