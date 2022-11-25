# Install script for directory: /home/asus/catkin_ws/src/DUCROT_LACHENY/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/asus/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so"
         RPATH "/home/asus/ws/underlay_isolated/install_isolated/lib:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux/plugins:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux/types:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY/types:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY/plugins:/home/asus/catkin_ws/install/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY" TYPE SHARED_LIBRARY FILES "/home/asus/catkin_ws/devel/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so"
         OLD_RPATH "/home/asus/ws/underlay_isolated/install_isolated/lib::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/asus/ws/underlay_isolated/install_isolated/lib:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux/plugins:/home/asus/ws/underlay_isolated/install_isolated/lib/orocos/gnulinux/types:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY/types:/home/asus/catkin_ws/install/lib/orocos/gnulinux/DUCROT_LACHENY/plugins:/home/asus/catkin_ws/install/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/orocos/gnulinux/DUCROT_LACHENY/libDUCROT_LACHENY-gnulinux.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/orocos/DUCROT_LACHENY" TYPE FILE FILES "/home/asus/catkin_ws/src/DUCROT_LACHENY/src/DUCROT_LACHENY-component.hpp")
endif()

