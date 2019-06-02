# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "img_prc: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(img_prc_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_custom_target(_img_prc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "img_prc" "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_custom_target(_img_prc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "img_prc" "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_custom_target(_img_prc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "img_prc" "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_custom_target(_img_prc_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "img_prc" "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" "sensor_msgs/Image:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
)
_generate_srv_cpp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
)
_generate_srv_cpp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
)
_generate_srv_cpp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
)

### Generating Module File
_generate_module_cpp(img_prc
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(img_prc_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(img_prc_generate_messages img_prc_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_cpp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_cpp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_cpp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_cpp _img_prc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(img_prc_gencpp)
add_dependencies(img_prc_gencpp img_prc_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS img_prc_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
)
_generate_srv_eus(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
)
_generate_srv_eus(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
)
_generate_srv_eus(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
)

### Generating Module File
_generate_module_eus(img_prc
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(img_prc_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(img_prc_generate_messages img_prc_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_eus _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_eus _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_eus _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_eus _img_prc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(img_prc_geneus)
add_dependencies(img_prc_geneus img_prc_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS img_prc_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
)
_generate_srv_lisp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
)
_generate_srv_lisp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
)
_generate_srv_lisp(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
)

### Generating Module File
_generate_module_lisp(img_prc
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(img_prc_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(img_prc_generate_messages img_prc_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_lisp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_lisp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_lisp _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_lisp _img_prc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(img_prc_genlisp)
add_dependencies(img_prc_genlisp img_prc_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS img_prc_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
)
_generate_srv_nodejs(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
)
_generate_srv_nodejs(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
)
_generate_srv_nodejs(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
)

### Generating Module File
_generate_module_nodejs(img_prc
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(img_prc_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(img_prc_generate_messages img_prc_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_nodejs _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_nodejs _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_nodejs _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_nodejs _img_prc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(img_prc_gennodejs)
add_dependencies(img_prc_gennodejs img_prc_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS img_prc_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
)
_generate_srv_py(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
)
_generate_srv_py(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
)
_generate_srv_py(img_prc
  "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
)

### Generating Module File
_generate_module_py(img_prc
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(img_prc_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(img_prc_generate_messages img_prc_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Negbild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_py _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Dominant.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_py _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Kanten.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_py _img_prc_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/img_prc/srv/Graubild.srv" NAME_WE)
add_dependencies(img_prc_generate_messages_py _img_prc_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(img_prc_genpy)
add_dependencies(img_prc_genpy img_prc_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS img_prc_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/img_prc
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(img_prc_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(img_prc_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(img_prc_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/img_prc
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(img_prc_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(img_prc_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(img_prc_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/img_prc
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(img_prc_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(img_prc_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(img_prc_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/img_prc
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(img_prc_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(img_prc_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(img_prc_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/img_prc
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(img_prc_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(img_prc_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(img_prc_generate_messages_py std_msgs_generate_messages_py)
endif()
