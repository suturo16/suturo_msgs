
Package object_state 
-------------------------------

Es folgt eine kurze Einleitung in das Package 'object_state'.

Was ist 'object_state'?
-----------------------
MS1:
Das Package stellt einen listener für das Perception-Topic 'percepteros/object_detection' bereit und hört es ab. Die Informationen aus dem Perception-Topic werden dann weiterverarbeitet, indem eine KnowRob-Repräsentation erzeugt wird. Mittels dieser können wir dann Wissen inferieren.

MS2:
Das Package stellt nun weitere Funktionalitäten bereit. Es können beispielsweise die Position und Orientierung von gültigen Fluent-Objekten über ein Pythonskript auf das tf topic gepublished werden.

Das Package enthält:

* eine Prolog-Klasse 'prolog_object_state.pl' um die KnowRob-internen Objekte zu erzeugen
* einen Subscriber für 'percepteros/object_detection' namens 'Listener.java' (Fehlerhaft, Stand 2/2017)
* einen Subscriber für 'percepteros/object_detection' namens 'subscriber.py' 
* Launchfiles für je einen Subscriber, die Prolog-Klasse sowie für alle zur Ausführung nötigen Komponenten zusammen, erkennbar am Dateinamen

* einen Python-Broadcaster namens "fluents_tf_publisher.py"  

.. note:: Vorerst solltet ihr nur den Python-Subscriber benutzen, da der Java-Subscriber noch fehlerhaft ist. Wenn ihr 'object_state.launch' ausführt wird standartmäßig der Python-Subscriber gestartet.


Verwendung und Testlauf des Subscribers "subscriber.py" und der KnowRob-internen Objektrepräsentation
------------------------------------------------------------------------------------------------------

.. note:: Öffnet eine Kommandozeile à la Terminator und teilt sie in 4 Shells auf, da es sonst extrem unübersichtlich wird. Im weiteren sind die unterschiedlichen Terminals mit t1(oben links), t2(oben rechts), t3(unten links) und t4(unten rechts) benannt.

1. Schritt 

Wir starten zunächst die Prolog Komponente in t1::

	roslaunch object_state prolog.launch

.. note:: roslaunch startet, sofern noch nicht vorher geschehen, einen roscore. Ihr braucht also keinen separaten roscore zu starten.

2. Schritt

Wir publishen Daten auf dem Topic, welches der Subscriber abhört.

Dazu nutzen wir folgendes Kommando in t2::

	percepteros/object_detection suturo_perception_msgs/ObjectDetection

Danach mehrfach Tab drücken um ein Aufruf-Template zu erzeugen, oder alternativ den nachfolgenden Aufruf verwenden::

	rostopic pub percepteros/object_detection suturo_perception_msgs/ObjectDetection "name: 'cylinder'
	pose:
	  header:
	    seq: 0
	    stamp: {secs: 0, nsecs: 0}
	    frame_id: 'odom_combined'
	  pose:
	    position: {x: 4.0, y: 6.0, z: 0.5}
	    orientation: {x: 3.0, y: 8.0, z: 6.0, w: 4.0}
	type: 1
	width: 7.0
	height: 5.0
	depth: 4.0" -r 15



3. Schritt

Jetzt können wir den Subscriber in t3 starten::

	roslaunch object_state subscriber_py.launch

Dieser erhält jetzt mit der zuvor festgelegten Frequenz von 15 Herz die Daten die auf das Topic 'percepteros/object_detection' gepublished werden. Es ist möglich, dass durch die verwendung des Launchfiles kein sichtbarer Output generiert wird, es werden trotzdem Daten empfangen.

3.1 (Optional)
Wenn unbedingt visueller Output erwünscht ist, kann der Subscriber auch ohne Launchfile gestartet werden, und zwar so::

	rosrun object_state subscriber.py

4. Schritt

Wir wollen jetzt mit einer Prolog-Query das von uns gepublishte Objekt, für das mittlerweile durch die Funktionalität des Subscribers und der in 'object_state.pl' definierten Funktionen eine KnowRob-Repräsentation erzeugt wurde, anfragen. Dazu nutzen wir den Rosservice simple_query, der es uns ermöglicht, Prolog-Anfragen zu stellen und führen das folgende Kommando in t4 aus::

	rosservice call /json_prolog/simple_query

und vervollständigen den Aufruf wie gewohnt mit doppel-Tab, oder verwenden den folgenden Aufruf::

	rosservice call /json_prolog/simple_query "mode: 0
	id: '1337'
	query: 'get_object_infos(knowrob:cylinder,Frame,Height,Width,Depth)'"

Wir wollen nun die Funktion 'get_object_infos()' aufrufen, um alle möglichen Informationen über ein Objekt, von dem wir nur den Namen wissen, zu bekommen.
Zum Testen könnt ihr eine beliebige ID verwenden, müsst aber darauf achten, dass ihr im nächsten Schritt die selbe ID wieder angebt.

Es wird noch ein weiterer Prolog-Aufruf benötigt um unsere Antwort zu generieren (hier unbedingt die selbe ID wie zuvor verwenden!)::

	rosservice call /json_prolog/next_solution "id: '1337'" 

Wie erwartet liefert uns die Methode alle aktuellen Werte des Objekts zurück::

	status: 3
	solution: {"Height":5,"Depth":4,"Frame":"odom_combined","Width":7}

Aber was, wenn sich nun die Werte unseres Objekts verändern?
Kein Problem für object_state!

Wir ändern einfach Mal einen Wert (Depth von 4.0 auf 88.0), und publishen das veränderte Objekt wie zu Beginn via Kommando in t2::

	rostopic pub percepteros/object_detection suturo_perception_msgs/ObjectDetection "name: 'cylinder'
	pose:
	  header:
	    seq: 0
	    stamp: {secs: 0, nsecs: 0}
	    frame_id: 'odom_combined'
	  pose:
	    position: {x: 4.0, y: 6.0, z: 0.5}
	    orientation: {x: 3.0, y: 8.0, z: 6.0, w: 4.0}
	type: 1
	width: 7.0
	height: 5.0
	depth: 88.0" -r 15

Jetzt Fragen wir erneut mittels Query das Objekt in t4 an(andere ID, da neuer Prolog Aufruf!)::

	rosservice call /json_prolog/simple_query "mode: 0
	id: '133788'
	query: 'get_object_infos(knowrob:cylinder,Frame,Height,Width,Depth)'" 
	ok: True
	message: ''

Nun brauchen wir, wie zuvor auch schon, den zweiten Prolog-Call um die Lösung der Anfrage zu generieren (hier wieder die selbe ID nutzen, wie im Schritt zuvor!)::
	
	rosservice call /json_prolog/next_solution "id: '133788'" 

É voila, die Werte des Objekts haben sich auf magische Weise verändert::
	
	status: 3
	solution: {"Height":5,"Depth":88,"Frame":"odom_combined","Width":7}


Verwendung und Test des TF Broadcasters
----------------------------------------

Für die Erweiterung des Packages 'object_state' wurde die Prolog-Klasse 'prolog_object_state.pl' erweitert. Außerdem wurde 'fluents_tf_broadcaster.py' als neues Pythonskript implementiert.
Ziel dieser Erweiterungen war, die Position und Orientierung aus offenen Fluent-Objekten an das tf-topic zu publishen.

Umsetzung, Verwendung und Test der neuen Funktionalität wird hier Schritt für Schritt dokumentiert.

Zunächst öffnen wir auf einem freien Workspace vier Shells. Dabei stehen im Folgenden die Abkürzungen T1-T4 für die vier Shells, wobei die Zuordnung wie folgt aussieht: T1 oben links, T2 oben rechts, T3 unten links, T4 unten rechts.

#1. Schritt
Wir beginnen damit, das Prolog-Modul des 'object_state'-Packages zu starten (ROS-Core wird automatisch mitgestartet).

	roslaunch object_state object_state_prolog.launch
	
Als nächstes nutzen wir den Service /json_prolog/simple_query um mittels der in Prolog implementierten Dummy-Methoden echte Objektwahrnehmungen zu simulieren. Dazu kopieren wir das Folgende Kommando in T2 und lösen mittels doppeltem Drücken der TAB-Taste die automatische Vervollständigung aus.
(Als Parameter übergeben wir irgeneinen Namen, z.B. "`baum"' sowie eine beliebige ID):
	
	rosservice call /json_prolog/simple_query

Der vollständige Aufruf sieht dann etwa so aus:

	rosservice call /json_prolog/simple_query "mode: 0
	id: '1'
	query: 'dummy_perception(baum)'" 

Dieses Kommando ruft die Prolog-Funktion dummy_perception(Name) auf, welche die die KnowRob-interne Repräsentation für Objekte erzeugt.

Jetzt kopieren wir (wieder per doppel TAB vervollständigen) in T2::

	rosservice call /json_prolog/next_solution

In dem erzeugten Aufruftemplate setzen wir die Id auf den selben Wert wie im vorherigen Kommando. Durch den Aufruf von next_solution wird die zuvor gestellte Query ausgeführt und wir erhalten eine Lösung, wenn es eine gibt.

Da wir die Query sauber schließen wollen, um die verwendete ID wieder verwendbar zu machen führen wir noch folgendes in T2 aus::

	rosservice call /json_prolog/finish "id: '1'"


Wir starten jetzt in T3 den TF-Broadcaster, indem wir mit folgendem Kommando das Pythonskript fluent_tf_publisher.py ausführen.::

	rosrun object_state fluents_tf_publisher.py

Auf der Konsole sollte sofort ersichtlich sein, dass der Publisher anfängt zu arbeiten. Die Textausgabe dient nur zur Information und wird vermutlich noch häufiger angepasst.

Jetzt wollen wir überprüfen, was auf dem TF-Topic ankommt, dazu wechseln wir zu T4 und führen folgendes Kommando aus, um wiederzugeben, was im TF-Topic gepublished wird.::

	rostopic echo /tf

Wir sehen jetzt, dass mit hoher Frequenz die von der Dummy-Funktion erzeugten Werte gepublished werden. Soweit sogut. Wir verwenden jetzt zwei weitere Dummy-Funktionen, um zu überprüfen, wie sich die gepublishten Werte aktualisieren, wenn die Fluents "`updaten"'. Dazu führen wir in T2 folgendes aus::

	rosservice call /json_prolog/simple_query "mode: 0
	id: '2'
	query: 'dummy_perception_with_close(baum)'" 

Meistens ist es einfacher, den beginn des Kommandos in die Konsole zu schreiben und mittels doppel-TAB das Kommando vervollständigen zu lassen. Die Werte könnt ihr dann so setzen wie oben zu sehen ist.

Danach führen wir wieder:: 

	rosservice call /json_prolog/next_solution "id: '2'" 

aus, um die Lösung zu generieren. In T4 können wir nun live beobachten, wie sich die Werte verändern. Somit haben wir erfolgreich die Veränderung von Fluent-Werten (Position, Orientierung) an das TF-Topic übertragen. Hier können sie jetzt für viele andere Aufgaben ausgelesen und weiterverwendet werden.

Der Vollständigkeit halber, sollte nun noch das Query in T2 geschlossen werden.::

	rosservice call /json_prolog/finish "id: '2'" 


Bei Fragen oder Problemen, schreibt mich direkt an.
Lukas S.