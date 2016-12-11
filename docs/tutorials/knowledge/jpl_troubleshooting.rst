
jpl Troubleshooting
===================

Hier werden zu verschiedenen Fehlermeldungen die Lösungsmöglichkeit beschrieben.

**Please add directory holding libjava.so to $LD_LIBRARY_PATH oder 
Please add directory holding libjvm.so to $LD_LIBRARY_PATH**


Wenn ihr in euren Fehlermeldungen diesen Hinweis findet könnt ihr dieses Problem mit dem folgendem Vorgehen lösen (am Beispiel libjava.so):

    1. Findet heraus wo eure libjava.so liegt: dpkg --search libjava.so. 
    
    2. Als nächstes fügt den gefundenen Pfad zu eurer LD_LIBRARY_PATH hinzu: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:GefundenerPfad
    
    3. Zuletzt exportiert diese: export LD_LIBRARY_PATH

Dies müsst ihr äquivalten auch für libjvm.so durchführen, wenn ihr danach gefragt werdet.

Beispiel Vorgehen, kopiert vom Terminal::

    Complete--~
    > dpkg --search libjava.so
    openjdk-7-jre-headless:amd64: /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/libjava.so
    Complete--~
    > LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/
    Complete--~
    > export LD_LIBRARY_PATH

Tipp: Ihr könnt die Änderung der $LD_LIBRARY_PATH Variable auch in eure .bashrc speichern, sodass ihr es nicht immer wiederholen müsst.