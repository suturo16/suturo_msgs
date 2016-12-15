Calling the Prolog interface
======================================

This brief arcticle is about calling the Prolog-Interface hosted by the knowledge group. 

Setting up
----------

To access the Prolog interface you need to clone and build the `knowledge repository <https://github.com/suturo16/knowledge>`_. To make it run you might want to look into the `SWI-Prolog installation <http://suturo.readthedocs.io/en/latest/tutorials/installation.html#swi-prolog-installieren>`_ and `KnowRob installation <http://suturo.readthedocs.io/en/latest/tutorials/installation.html#knowrob-installieren>`_ guides.

For Lisp you will have to acquire the following packages beforehand. They are listend in the `planning dependencies <https://github.com/suturo16/planning/blob/master/dependencies.rosinstall>`_ as well.

*  `cram_core <https://github.com/cram2/cram_core.git>`_
*  `cram_3rd_party <https://github.com/cram2/cram_3rdparty.git>`_
*  `cram_json_prolog <https://github.com/cram2/cram_json_prolog.git>`_

Launching the Prolog interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

As soon as the knowledge package is built you can start the Prolog interface. The interface is still in maintainance, a full guide for this part is provided asap.

Calling Prolog function from Lisp
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The signature of our main Prolog call is as follows ::

  prolog-get-values (prolog-function-name &rest arguments)

This function needs to know the functions name in the Prolog interface, like *getObjectInfos*, and all the arguments the prolog function expects. The response of *prolog-get-values* is a list of parameters, the response of the Prolog function. So if there is this Prolog function ::

  getObjectInfos(?Name, ?Frame, ?Height, ?Width, ?Depth)

you need to call the Lisp function like this ::

  (prolog-get-values "getObjectInfos" "zylinder")

and you shall recieve a list with the frame, height, width and depth for the object with given name. If you have more than one argument for a Prolog function, just add it to the *prolog-get-values* call, since it can handle as many arguments as you wish, but it needs at least the name of the Prolog function.


