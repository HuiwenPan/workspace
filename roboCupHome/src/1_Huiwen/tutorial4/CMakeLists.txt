cmake_minimum_required(VERSION 2.8.3)
project(tutorial4)

add_compile_options(-std=c++11)

find_package(OpenCV REQUIRED)
find_package(PCL REQUIRED)



# Catkin
find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  std_msgs
  sensor_msgs
  message_filters
  cv_bridge
  tf
  image_geometry
  image_transport
  darknet_ros_msgs
)

add_message_files(
	DIRECTORY msg
	FILES   
	Rect.msg	
)

add_service_files(
	  DIRECTORY srv
	  FILES
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  sensor_msgs
)


catkin_package(CATKIN_DEPENDS message_runtime std_msgs geometry_msgs sensor_msgs)


include_directories(include
  ${catkin_INCLUDE_DIRS}
  ${OpenCV_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
)



add_executable(from2dto3d src/from2Dto3D.cpp)
target_link_libraries(from2dto3d
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
  ${PCL_LIBRARIES}
)

add_executable(plane_segmentation src/PlaneSegmentation.cpp)
target_link_libraries(plane_segmentation 
  ${catkin_LIBRARIES} 
  ${OpenCV_LIBS} 
  ${PCL_LIBRARIES}
  )

install(TARGETS from2dto3d
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

