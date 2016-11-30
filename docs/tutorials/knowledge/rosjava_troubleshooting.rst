

rosjava Troubleshooting
=======================

Beim Umgang mit rosjava kann es zu verschiedenen Problemen kommen. Hier ein paar Lösungsvorschläge zu verschiedenen Situationen:

Probleme bei catkin_make
------------------------

    1. Unter Umständen müsst ihr auch rosjava sourcen (mit den üblichen Befehl: source /PATHTO/rosjava/devel/setup.bash). Tipp: Wenn ihr dies öfters machen müsst lohnt es sich dies in die .bashrc zu speichern.
    
    2. Achtet darauf in euren Packages "message_generation" als build_depend in jedem Package zu haben! Dies gilt selbst dann, wenn diese keine Messages oder Services generieren sollen.

Bauen eines eigenen rosjave - Packages
--------------------------------------

    1. Zum erstellen eines rosjava - Package benutzt den Befehl catkin_create_rosjava_pkg
    
    2. Achtet darauf build.gradle, gradle.settings, package.xml, CMakeLists.txt anzupassen.
    
    3. Prolog - Code sollte im Ordner Prolog liegen
    
    4. Wenn euer Java-Code externe .msg- und .srv- Dateien braucht, sollte folgendes beachtet werden:

        a. Die .msg- und .srv- Dateien sollten am besten in einem Packet liegen in dem kein C Code liegt.

        b. Um dieses Packet zu nutzen muss dieses eingebunden werden:
            
            i. Erstellt im Packet in dem ihr die .msg oder .srv nutzen wollt einen Ordner mit dem selbem Namen wie das Packet der .msg oder .srv
            
            ii. In der build.gradle "holt" ihr euch dann die Daten aus den externen Packeten.
        
        c. Außerdem müssen in den build.gradle vom Ordner mit dem Java - Code die Zeile "compile project(...)" hinzufügen.

rosjava - Package builded nicht 
-------------------------------

    1. Zum erstellen eines rosjava - Package benutzt den Befehl catkin_create_rosjava_pkg
    
    2. Achtet darauf build.gradle, gradle.settings, package.xml, CMakeLists.txt anzupassen.
    
    3. Prolog - Code sollte im Ordner Prolog liegen
    
    4. Wenn euer Java-Code externe .msg- und .srv- Dateien braucht, sollte folgendes beachtet werden:

        a. Die .msg- und .srv- Dateien sollten am besten in einem Packet liegen in dem kein C Code liegt.

        b. Um dieses Packet zu nutzen muss dieses eingebunden werden:
            
            i. Erstellt im Packet in dem ihr die .msg oder .srv nutzen wollt einen Ordner mit dem selbem Namen wie das Packet der .msg oder .srv
            
            ii. In der build.gradle "holt" ihr euch dann die Daten aus den externen Packeten.
        
        c. Außerdem müssen in den build.gradle vom Ordner mit dem Java - Code die Zeile "compile project(...)" hinzufügen.