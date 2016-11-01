Tutorial: Using the RPC Server Node for communication with Pepper
=================================================================

Here you will learn to use RPC (Remote Procedure Calls) to send messages from Pepper to CaterROS.

.. note:: This tutorial is for one way communication only. Pepper will be able to send information to a node in ROS but not the other way around.


Setting up
-----------

The process is composed of two parts, you will need to write a code in Pepper which allows her to send information via XML-RPC and of course setting up the Server on a ROS-Node.

You will also need Python in your system and 
