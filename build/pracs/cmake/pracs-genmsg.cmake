# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pracs: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ipracs:/home/rohan/catkin_ws/src/pracs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pracs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_custom_target(_pracs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pracs" "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_custom_target(_pracs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pracs" "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_custom_target(_pracs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pracs" "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs
)
_generate_msg_cpp(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs
)

### Generating Services
_generate_srv_cpp(pracs
  "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs
)

### Generating Module File
_generate_module_cpp(pracs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pracs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pracs_generate_messages pracs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_dependencies(pracs_generate_messages_cpp _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_dependencies(pracs_generate_messages_cpp _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_dependencies(pracs_generate_messages_cpp _pracs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pracs_gencpp)
add_dependencies(pracs_gencpp pracs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pracs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs
)
_generate_msg_eus(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs
)

### Generating Services
_generate_srv_eus(pracs
  "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs
)

### Generating Module File
_generate_module_eus(pracs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pracs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pracs_generate_messages pracs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_dependencies(pracs_generate_messages_eus _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_dependencies(pracs_generate_messages_eus _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_dependencies(pracs_generate_messages_eus _pracs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pracs_geneus)
add_dependencies(pracs_geneus pracs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pracs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs
)
_generate_msg_lisp(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs
)

### Generating Services
_generate_srv_lisp(pracs
  "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs
)

### Generating Module File
_generate_module_lisp(pracs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pracs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pracs_generate_messages pracs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_dependencies(pracs_generate_messages_lisp _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_dependencies(pracs_generate_messages_lisp _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_dependencies(pracs_generate_messages_lisp _pracs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pracs_genlisp)
add_dependencies(pracs_genlisp pracs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pracs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs
)
_generate_msg_nodejs(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs
)

### Generating Services
_generate_srv_nodejs(pracs
  "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs
)

### Generating Module File
_generate_module_nodejs(pracs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pracs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pracs_generate_messages pracs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_dependencies(pracs_generate_messages_nodejs _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_dependencies(pracs_generate_messages_nodejs _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_dependencies(pracs_generate_messages_nodejs _pracs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pracs_gennodejs)
add_dependencies(pracs_gennodejs pracs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pracs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs
)
_generate_msg_py(pracs
  "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs
)

### Generating Services
_generate_srv_py(pracs
  "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs
)

### Generating Module File
_generate_module_py(pracs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pracs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pracs_generate_messages pracs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/mymsg.msg" NAME_WE)
add_dependencies(pracs_generate_messages_py _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/msg/fuse.msg" NAME_WE)
add_dependencies(pracs_generate_messages_py _pracs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/rohan/catkin_ws/src/pracs/srv/mysrv.srv" NAME_WE)
add_dependencies(pracs_generate_messages_py _pracs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pracs_genpy)
add_dependencies(pracs_genpy pracs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pracs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pracs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pracs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pracs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pracs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pracs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pracs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pracs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pracs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pracs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pracs_generate_messages_py std_msgs_generate_messages_py)
endif()
