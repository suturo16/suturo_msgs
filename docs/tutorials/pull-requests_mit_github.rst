########################
Pull-Requests mit Github
########################

Achtung: Falls du deinen Workspace (mit den Repos aller Teilgruppen) noch nicht eingerichtet haben solltest, erledige dies zuerst.

Motivation: Da wir unseren Workflow im Masterprojekt verbessern wollen, haben wir uns dazu entschieden, neue Features auf separaten Branches zu entwickeln. Ist ein Feature fertig, stellt man ein Pull-Request. Diese Arbeitsweise hat den Vorteil, dass der Sourcecode auf dem Master-branch stets fehlerfrei ist (theoretisch...) und andere Gruppenmitglieder sich Zeit und Nerven mit nicht-kompilierbarem Code sparen.

**********
Los gehts!
**********

Nehmen wir an, du währst Mitglied der Teilgruppe für Manipulation und du 
möchtest ein neues Feature entwickeln.

1. Navigiere in das Manipulations-Repository ("~/suturo/ws/src/manipulation" 
   -oder Ähnlich) und erstelle einen neuen branch::

     git checkout -b deinBranchName

2. Führe wie gewohnt deine Implementierung durch und committe dabei den im 
   Projekt besprochenden Guidelines entsprechend in sinnvollen Einheiten mittels::

     git commit -m "commitMsg"

   Wenn du pushen möchtest, achte darauf, auf deinen branch zu pushen::

     git push -u origin deinBranchName

3. Auf https://github.com/ kannst du nun in das Manipulations-Repository 
   navigieren und dort ein Pull-Request für deinen branch beantragen. Sobald 
   jemand deinen branch reviewed und approved hat, wird er mit dem Master-branch
   gemerged und dein erstellter Branch gelöscht.

4. Nun wechselst du zum Master-branch zurück::
     
     git checkout master 

   und kannst dort normal pullen::
   
     git pull

   Jetzt hast du einen aktuellen master branch, in den dein Featurebranch bereits integriert ist.