Troubleshooting Planning
========================

Problem
-------

Die Repl gibt beim Laden eines System eine Meldung dieser Form aus::

    WARNING:
        System `std_msgs-msg` is compiled by a different process. Waiting for compilation of blocking file to finish.

Merke, dass keine Zeitangabe "mostly 60 seconds" gemacht wird.

Lösung
------

In diesem Fall ist der Lock im Cache gespeichert und kann, nach bisherigem Wissenstand, nur durch Löschen desselbigen behoben werden. Dazu  löscht man das Verzeichnis "~/.cache/common-lisp". dabei sollte nichts kaputt gehen und das Verzeichnis wird beim nächsten Start der Repl wieder angelegt. ::

    rm -rf ~/.cache/common-lisp