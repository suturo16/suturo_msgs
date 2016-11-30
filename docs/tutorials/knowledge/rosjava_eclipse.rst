
rosjava Eclipse
===============

Dies ist bisher nur eine vorläufige Empfehlung. Sie ist noch nicht dazu gedacht aus Eclipse zu starten oder ernsthaft zu kompilieren. 

rosjava - Projekt in Eclipse importieren
----------------------------------------

    1. Führe einmal catkin_make aus.
    
    2. Nun gehe zum entsprechenden rosjava - Packet und führe dort: ./gradlew eclipse aus. Achtung: Dazu muss dass eclipse - Plugin zum gradlew hinzugefügt worden sein.
    
    3. Fall ihr auf andere Packete verweist müsst ihr diese unter Umständen erst im Build von Eclipse einstellen:
        
        a. Rechts-klick auf das Projekt --> Properties --> Java Build Path
        
        b. Nun geht auf den Tab Libraries und fügt die entsprechenden .jar Dateien hinzu:
            
            i. Klickt auf Add JARs
            
            ii. Nun klappt die Ordner in folgender Reihenfolge aus:
            
            iii. EUER_PROJEKT --> build --> install --> EUER_PROJEKT --> lib
            
            iv. Sucht die entsprechende .jar (die .jar's haben meist einen Namen der Form: EUER_ZIEL-1.4.0.jar)