cmake_minimum_required(VERSION 2.8.3)
project(suturo_perception_msgs)

find_package(catkin REQUIRED COMPONENTS
  actionlib_msgs
  geometry_msgs
  std_msgs
  message_generation
)


## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   ObjectDetection.msg
   CollisionObject.msg
   CollisionObjects.msg
 )

## Generate services in the 'srv' folder
 add_service_files(
   FILES
   RunPipeline.srv
   PerceiveAction.srv
 )

## Generate added messages and services with any dependencies listed here
generate_messages(
   	DEPENDENCIES
   	actionlib_msgs
 	  geometry_msgs
   	std_msgs
)


###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES suturo_perception_msgs
 	CATKIN_DEPENDS actionlib_msgs geometry_msgs std_msgs message_runtime
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)


