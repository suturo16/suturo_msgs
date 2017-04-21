Running planning ms1
========================

Terminal des Vertrauens öffnen und einen roscore starten.

	roscore

Zum Testen, muss man noch die mockups ausführen, mit:

	roslaunch sut_mockups general.launch

Dieser spammt unter anderem auf dem topic /pepper_command den Befehl "left".


In der Emacs repl:

	,
	ros-load-system >ENTER<
	pepper_communication >ENTER<
	pepper-communication-system >ENTER<

Dies sollte das system laden und compilieren. Anschließend kann man in das pepper paket wechseln mit: 

	,
	in-package >ENTER<
	PEPPER-COMMUNICATION-PACKAGE >ENTER<

Man muss noch den ActionServer mockup starten. Der braucht einen laufenden Node, also:

	(start-ros-node "my_node")
	(pr2-do::setup-move-robot-client)


Dannach kann man in einer neuen repl, in der man wieder in das pepper-communication paket reingeht, dann listen to pepper aufrufen.

	(listen-to-pepper)

