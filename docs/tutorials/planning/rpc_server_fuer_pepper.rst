Using the RPC Server Node for communication with Pepper
=======================================================

Here you will learn to use RPC (Remote Procedure Calls) to send messages from Pepper to CaterROS. Look at the documentation for RPC Server in Planning to see which methods are available(not yet there).

.. note:: This tutorial is for one way communication only. Pepper will be able to send information to a node in ROS but not the other way around.


Setting up
----------

The process is composed of two parts, you will need to write a code in Pepper which allows her to send information via XML-RPC and of course setting up the Server on a ROS-Node.

You will also need Python in your system and of course, the built CaterROS project.

Writing an easy Python script at Pepper to send messages from
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For this you only need to know the IP address of the computer running the RPC Server.

.. Note: Your code can be run in a myriad of ways, I used Choreograph to pass my scripts to Pepper.

1. Write something leading to a Python Script. For that read/watch some tutorials about using Pepper.

2. Your Python script will need to import the xmlrpclib.

3. Connect to the server by using:
     ``server = xmlrpclib.Server('http:// >>IP ADDRESS FROM SERVER<< :7080/')``
     
   Without the spaces, the port stays the same.
     
4. Now you can already send messages to the server. Use any command the server has like that:
     ``server.COMMAND(PARAMETERS)``
     
Here is an example of a simple message sent to the Server, this command will echo everything sent to the topic **pepper_command**::

     #!/usr/bin/env python
     
     import xmlrpclib
     
     """
     Saving the server for later use.
     """
     server = xmlrpclib.Server('http://123.456.789.10:7080/')
     
     
     """
     The main class. This will run as soon as the script is used, on pepper you
     want to pack the server commands on the onStart method, not here.
     """
     if __name__ == '__main__':          
          server.echo("At the end of the test, there will be cake.")
          pass

Starting up the Server!
^^^^^^^^^^^^^^^^^^^^^^^^

What is the point of sending informations to a server if it is switched off? That's right! None!
Here we will start up our XML-RPC Server in two easy steps!

1. After starting roscore and the whole shabang use

      ``$ rosrun pepper_communication rpc_server.py``
   
   A message telling you the server is ready to use should appear.

2. That's it, note the IP adress of the machine via *ifconfig* or whatnot and use that.
