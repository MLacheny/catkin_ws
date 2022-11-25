// Generated by gencpp from file ecobot/ussensor_mngtResponse.msg
// DO NOT EDIT!


#ifndef ECOBOT_MESSAGE_USSENSOR_MNGTRESPONSE_H
#define ECOBOT_MESSAGE_USSENSOR_MNGTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ecobot
{
template <class ContainerAllocator>
struct ussensor_mngtResponse_
{
  typedef ussensor_mngtResponse_<ContainerAllocator> Type;

  ussensor_mngtResponse_()
    : response()
    , deactivated_id()  {
    }
  ussensor_mngtResponse_(const ContainerAllocator& _alloc)
    : response(_alloc)
    , deactivated_id(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _response_type;
  _response_type response;

   typedef std::vector<int8_t, typename ContainerAllocator::template rebind<int8_t>::other >  _deactivated_id_type;
  _deactivated_id_type deactivated_id;





  typedef boost::shared_ptr< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ussensor_mngtResponse_

typedef ::ecobot::ussensor_mngtResponse_<std::allocator<void> > ussensor_mngtResponse;

typedef boost::shared_ptr< ::ecobot::ussensor_mngtResponse > ussensor_mngtResponsePtr;
typedef boost::shared_ptr< ::ecobot::ussensor_mngtResponse const> ussensor_mngtResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ecobot::ussensor_mngtResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ecobot::ussensor_mngtResponse_<ContainerAllocator1> & lhs, const ::ecobot::ussensor_mngtResponse_<ContainerAllocator2> & rhs)
{
  return lhs.response == rhs.response &&
    lhs.deactivated_id == rhs.deactivated_id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ecobot::ussensor_mngtResponse_<ContainerAllocator1> & lhs, const ::ecobot::ussensor_mngtResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ecobot

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "05c06354f3bbf9f7662849c88e93e3f9";
  }

  static const char* value(const ::ecobot::ussensor_mngtResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x05c06354f3bbf9f7ULL;
  static const uint64_t static_value2 = 0x662849c88e93e3f9ULL;
};

template<class ContainerAllocator>
struct DataType< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ecobot/ussensor_mngtResponse";
  }

  static const char* value(const ::ecobot::ussensor_mngtResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string response\n"
"int8[] deactivated_id\n"
"\n"
;
  }

  static const char* value(const ::ecobot::ussensor_mngtResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.response);
      stream.next(m.deactivated_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ussensor_mngtResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ecobot::ussensor_mngtResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ecobot::ussensor_mngtResponse_<ContainerAllocator>& v)
  {
    s << indent << "response: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.response);
    s << indent << "deactivated_id[]" << std::endl;
    for (size_t i = 0; i < v.deactivated_id.size(); ++i)
    {
      s << indent << "  deactivated_id[" << i << "]: ";
      Printer<int8_t>::stream(s, indent + "  ", v.deactivated_id[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ECOBOT_MESSAGE_USSENSOR_MNGTRESPONSE_H