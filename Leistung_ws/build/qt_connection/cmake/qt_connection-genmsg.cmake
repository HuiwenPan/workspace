# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "qt_connection: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(qt_connection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_custom_target(_qt_connection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qt_connection" "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" ""
)

get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_custom_target(_qt_connection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qt_connection" "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" ""
)

get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_custom_target(_qt_connection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qt_connection" "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" ""
)

get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_custom_target(_qt_connection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "qt_connection" "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
)
_generate_srv_cpp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
)
_generate_srv_cpp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
)
_generate_srv_cpp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
)

### Generating Module File
_generate_module_cpp(qt_connection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(qt_connection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(qt_connection_generate_messages qt_connection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_cpp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_cpp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_cpp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_cpp _qt_connection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qt_connection_gencpp)
add_dependencies(qt_connection_gencpp qt_connection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qt_connection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
)
_generate_srv_eus(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
)
_generate_srv_eus(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
)
_generate_srv_eus(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
)

### Generating Module File
_generate_module_eus(qt_connection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(qt_connection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(qt_connection_generate_messages qt_connection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_eus _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_eus _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_eus _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_eus _qt_connection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qt_connection_geneus)
add_dependencies(qt_connection_geneus qt_connection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qt_connection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
)
_generate_srv_lisp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
)
_generate_srv_lisp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
)
_generate_srv_lisp(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
)

### Generating Module File
_generate_module_lisp(qt_connection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(qt_connection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(qt_connection_generate_messages qt_connection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_lisp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_lisp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_lisp _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_lisp _qt_connection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qt_connection_genlisp)
add_dependencies(qt_connection_genlisp qt_connection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qt_connection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
)
_generate_srv_nodejs(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
)
_generate_srv_nodejs(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
)
_generate_srv_nodejs(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
)

### Generating Module File
_generate_module_nodejs(qt_connection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(qt_connection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(qt_connection_generate_messages qt_connection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_nodejs _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_nodejs _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_nodejs _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_nodejs _qt_connection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qt_connection_gennodejs)
add_dependencies(qt_connection_gennodejs qt_connection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qt_connection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
)
_generate_srv_py(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
)
_generate_srv_py(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
)
_generate_srv_py(qt_connection
  "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
)

### Generating Module File
_generate_module_py(qt_connection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(qt_connection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(qt_connection_generate_messages qt_connection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Ready.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_py _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/AbRatio.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_py _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/EgoPos.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_py _qt_connection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/phw/catkin_ws/src/qt_connection/srv/Color.srv" NAME_WE)
add_dependencies(qt_connection_generate_messages_py _qt_connection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(qt_connection_genpy)
add_dependencies(qt_connection_genpy qt_connection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS qt_connection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/qt_connection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(qt_connection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/qt_connection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(qt_connection_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/qt_connection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(qt_connection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/qt_connection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(qt_connection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/qt_connection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(qt_connection_generate_messages_py std_msgs_generate_messages_py)
endif()