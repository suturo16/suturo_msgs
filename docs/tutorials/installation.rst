

Installation: Projekt und Dependencies einrichten
=================================================

Dieser Artikel soll das Vorgehen aufzeigen, um das Projekt auf euren Rechner neu aufzusetzen.


Step-by-step Guide
------------------

Vorrausgesetzte Software: ROS-Indigo (Empfohlenes Ros-Paket: ros-indigo-desktop-full)

Build-Prerequisites
^^^^^^^^^^^^^^^^^^^

Folgende Schritte müssen ausgeführt werden damit unser Projekt builded:


    1. Installiere benötigte Packete::

         sudo apt-get install ros-indigo-catkin ros-indigo-rospack python-wstool


    2. Installiert rosjava über folgenden Befehl::

         sudo apt-get install ros-indigo-rosjava ros-indigo-rosjava-*
    
    3. PR2 Naviagtion installieren::

         sudo apt-get install ros-indigo-pr2-navigation

oder alles auf einmal installieren::

  sudo apt-get install ros-indigo-catkin ros-indigo-rospack python-wstool ros-indigo-rosjava ros-indigo-rosjava-* ros-indigo-pr2-navigation


Workspace einrichten
^^^^^^^^^^^^^^^^^^^^
    
    1. Erstellt euch irgendwo ein Workspace, z.B.::
       
         mkdir ~/catkin_ws/src


    2. Initialisiert das Workspace::
       
         cd ~/catkin_ws/src
         catkin_init_workspace


    3. Sourced euer workspace oder fügt es gleich zur .bashrc hinzu::

        cd ~/catkin_init_workspace
        catkin_make # Because the will be no devel folder if you haven't maked once
        source ~/catkin_ws/devel/setup.bash

       oder::

        catkin_make # Because the will be no devel folder if you haven't maked once
        cd ~
        echo "source ~/catkin_ws/devel/setup.bash" >> .bashrc
        bash

       Wichtig ist hierbei, das der sourcen eures Workspaces nachdem sourcen von rosjava in eurer .bashrc auftaucht.

Wiederholt das ganze um ein Workspace einzurichten, dass nur für eure Dependencies wie knowrob und cram sind::
     
    mkdir ~/suturo_dep/src
    cd ~/suturo_dep/src
    catkin_init_workspace
    cd ..
    catkin_make # Because the will be no devel folder if you haven't maked once
    source ~/catkin_ws/devel/setup.bash
    cd ~
    echo "source ~/suturo_dep/devel/setup.bash" >> .bashrc
    bash

Führt folgende Befehle aus::

    rosdep update
    cd ~/suturo_dep/src # oder, wenn ihr ein package nur für die dependencies haben wollt, wechselt hier in diesem
    wstool init # maybe unnecessary for you
    wstool merge https://raw.github.com/knowrob/knowrob/indigo/rosinstall/knowrob-base.rosinstall
    wstool update
    rosdep install --ignore-src --from-paths stacks/ 

.. note:: Quelle und evtl. weitere Infos: http://www.knowrob.org/installation/catkin

Klont unsere Repositories in den src Ordner eures Workspaces. Ihr braucht knowledge, planning, perception, manipulation und suturo_msgs.

Der entsprechende git - Befehl wäre::

    git clone git@gitlab.informatik.uni-bremen.de:suturo/<modul name>.git

Die URL's sind:

+--------------+------------------------------------------+----------------------------------------------+
| Name         | SSH                                      | HTTPS                                        |
+--------------+------------------------------------------+----------------------------------------------+
| planning     | git@github.com:suturo16/planning.git     | https://github.com/suturo16/planning.git     |
+--------------+------------------------------------------+----------------------------------------------+
| perception   | git@github.com:suturo16/perception.git   | https://github.com/suturo16/perception.git   |
+--------------+------------------------------------------+----------------------------------------------+
| knowledge    | git@github.com:suturo16/knowledge.git    | https://github.com/suturo16/knowledge.git    |
+--------------+------------------------------------------+----------------------------------------------+
| manipulation | git@github.com:suturo16/manipulation.git | https://github.com/suturo16/manipulation.git |
+--------------+------------------------------------------+----------------------------------------------+
| suturo_msgs  | git@github.com:suturo16/suturo_msgs.git  | https://github.com/suturo16/suturo_msgs.git  |
+--------------+------------------------------------------+----------------------------------------------+


.. note:: Achtet darauf dass ihr rosjava und euer workspace beim builden gesourced habt. Überprüfen könnt ihr dies mit "echo $ROS_PACKAGE_PATH"


Nun könnt ihr euer Workspace builden

Optional Guide
^^^^^^^^^^^^^^

Folgende Schritte müssen ausgeführt werden damit ihr unser Projekt vollständig nutzen und ausführen könnt:

SWI-Prolog installieren
"""""""""""""""""""""""

SWI-Prolog wird benötigt, damit die json_prolog Services aufgerufen werden können::

    sudo apt-get install swi-prolog swi-prolog-*

Vor der ersten Nutzung von Prolog kann es zu verschiedenen Fehlern kommen. Seht dazu den Artikel jpl Troubleshooting.

.. note:: Den artikel gibt es noch nicht.


Umgebungsvariablen
""""""""""""""""""

a. Fügt die JAVA_HOME und SWI_HOME_DIR Umgebungsvariablen hinzu::

    export JAVA_HOME=/usr/lib/jvm/default-java
    export SWI_HOME_DIR=/usr/lib/swi-prolog


b. Füge die Java - Ordner zu LD_LIBRARY_PATH hinzu. Wählt je den für euer System richtigen Befehl aus::

    # for amd_64 systems (64 bits):
    export LD_LIBRARY_PATH=/usr/lib/jvm/default-java/jre/lib/amd64:/usr/lib/jvm/default-java/jre/lib/amd64/server:$LD_LIBRARY_PATH
     
    # for i386 systems (32bits):
    export LD_LIBRARY_PATH=/usr/lib/jvm/default-java/jre/lib/i386:/usr/lib/jvm/default-java/jre/lib/i386/server:$LD_LIBRARY_PATH

c. Optional: Prolog-History:
   "It is further recommended to add the following to your ~/.plrc file (create it if it does not exist). This will give you a global command history for the Prolog shell, which is very convenient when you have to repeatedly restart Prolog during testing and debugging." ::

        rl_write_history :-
          expand_file_name("~/.pl-history", [File|_]),
          rl_write_history(File).

        :- (
          current_prolog_flag(readline, true)
         ->
          expand_file_name("~/.pl-history", [File|_]),
          (exists_file(File) -> rl_read_history(File); true),
          at_halt(rl_write_history)
         ;
          true
         ).

   Quelle und evtl. weitere Infos: http://www.knowrob.org/installation/workspace

d. Lisp über Emacs
   Installiert folgendes um Lisp in Emacs ausführen zu können::

    sudo apt-get install ros-indigo-roslisp-repl

