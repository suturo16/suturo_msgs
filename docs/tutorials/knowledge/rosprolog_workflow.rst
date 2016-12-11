
rosprolog Workflow
=================================================

Um mit jpl zu Arbeiten gibt es verschiedene Möglichkeiten. Hier werde einige davon genannt und beschrieben.

Commandline
------------------

Um in eurem Rospacket ein Prolog Package zu starten muss folgender Command ausgeführt werden::
	
	rosrun rosprolog rosprolog NAME_EURES_PACKET

Danach könnte auf die verschiedenen Funktionen zugegriffen werden, die im Packet definiert wurden.

Um die Oberfläche zu beenden, nutzt folgenden Befehl ein::
	
	halt.

json_prolog
------------------

Um ein json_prolog service mit euren Packet anzubieten bietet sich ein launch-File in der folgenden Form an::

	<launch>
 		<param name="initial_package" type="string" value="NAME_EURES_PACKETS" />
  		<param name="initial_goal" type="string" value="owl_parse('package://PATHTO/EUREOWL.owl')" />
  		<node name="json_prolog" pkg="json_prolog" type="json_prolog_node" cwd="node" output="screen" />
	</launch>

In der zweiten Zeile könnt ihr nun den Namen eures Packets eintragen. In der dritten Zeile den Pfad zu euren owl-File. Wenn ihr kein .owl - File nutzt könnt ihr diese Zeile weglassen.