# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "create_map: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(create_map_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_custom_target(_create_map_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "create_map" "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(create_map
  "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/create_map
)

### Generating Module File
_generate_module_cpp(create_map
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/create_map
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(create_map_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(create_map_generate_messages create_map_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_dependencies(create_map_generate_messages_cpp _create_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(create_map_gencpp)
add_dependencies(create_map_gencpp create_map_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS create_map_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(create_map
  "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/create_map
)

### Generating Module File
_generate_module_eus(create_map
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/create_map
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(create_map_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(create_map_generate_messages create_map_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_dependencies(create_map_generate_messages_eus _create_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(create_map_geneus)
add_dependencies(create_map_geneus create_map_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS create_map_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(create_map
  "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/create_map
)

### Generating Module File
_generate_module_lisp(create_map
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/create_map
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(create_map_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(create_map_generate_messages create_map_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_dependencies(create_map_generate_messages_lisp _create_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(create_map_genlisp)
add_dependencies(create_map_genlisp create_map_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS create_map_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(create_map
  "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/create_map
)

### Generating Module File
_generate_module_nodejs(create_map
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/create_map
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(create_map_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(create_map_generate_messages create_map_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_dependencies(create_map_generate_messages_nodejs _create_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(create_map_gennodejs)
add_dependencies(create_map_gennodejs create_map_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS create_map_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(create_map
  "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/create_map
)

### Generating Module File
_generate_module_py(create_map
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/create_map
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(create_map_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(create_map_generate_messages create_map_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/create_map/srv/create_map_srv.srv" NAME_WE)
add_dependencies(create_map_generate_messages_py _create_map_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(create_map_genpy)
add_dependencies(create_map_genpy create_map_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS create_map_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/create_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/create_map
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(create_map_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(create_map_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/create_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/create_map
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(create_map_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(create_map_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/create_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/create_map
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(create_map_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(create_map_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/create_map)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/create_map
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(create_map_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(create_map_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/create_map)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/create_map\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/create_map
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(create_map_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(create_map_generate_messages_py geometry_msgs_generate_messages_py)
endif()
