Travis-CI
=========

Unser Projekt nutzt Travis-CI für Continuous Integration.
Bei jedem Push auf einem Branch (egal welchem) in einem unserer Repositories wird automatisch ein Build von Travis angestoßen. So kann man jederzeit sehen, ob der eigene Branch problemlos gebaut werden kann.

Auch bei einem Pull-Request wird noch einmal ein Build angestoßen.


Konfiguration
-------------

Der Build-Prozess von Travis kann durch die in jedem Repository liegende .travis.yml konfiguriert werden.


Dependencies
^^^^^^^^^^^^

Wir unterscheiden zwischen zwei Arten von Dependencies:

- System Dependencies, die durch rosdep installiert werden können. Dazu gehören z.B. auch andere ROS Pakete. Diese Dependencies müssen in rosdistro bekannt sein und werden mit apt-get installiert.

- Package Dependencies, die von Source ausgecheckt werden müssen. Diese werden mit wstool abgedeckt und sollten in der dependencies.rosinstall in dem jeweiligem Repository eingetragen werden.

Alle Dependencies sollten in dieser Art behandelt werden. Man sollte keine Dependencies direkt in der .travis.yml eintragen und "manuell" installieren. Wenn beim Build von Travis ein Paket fehlt, fehlt es wahrscheinlich in der package.xml.


Catkin-Optionen
^^^^^^^^^^^^^^^

Es gibt außerdem die Möglichkeit extra Optionen an den catkin_make Aufruf zu übergeben. Dazu trägt man diese einfach in die catkin.options in dem jeweiligem Repository ein.