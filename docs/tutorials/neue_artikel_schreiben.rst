Tutorial: Neue Artikel schreiben
================================

Doku schreiben
--------------

Die Artikel in diesem/r Wiki/Doku liegen als .rst-Dateien in dem suturo_msgs-Repository im Ordner *docs*.
Darin gibt es die drei Unterverzeichnisse *organisation*, *tutorials* und *implementierung*. Diese entsprechen den drei Kategorien in der Sidebar/Inhaltsverzeichnis. Ihr wählt also das passende Verzeichnis und erstellt darin eine neue .rst-Datei mit dem Namen eures Artikels.

.. note:: Namenskonvention ist *name_eures_artikels.rst*, also einfach spaces durch _ ersetzen und alles klein.

In dieser Datei schreibt ihr dann mit einem Editor eures Vertrauens *reStructuredText*. Das ist eine Markup-Sprache, die relativ einfach ist um simple Texte zu schreiben, aber auch mächtig genug um halbwegs schöne Artikel zu produzieren.

.. note:: Eine relativ gute Übersicht über reSt gibt's `hier <http://www.sphinx-doc.org/en/stable/rest.html>`_. Man kann sich natürlich auch immer die anderen Source-Dateien angucken um sich Inspiration zu holen. Dafür gibt es auch den "Edit on GitHub" Button oben rechts.

Damit der Artikel im Inhaltsverzecihnis auftaucht, muss er in der *index.rst* noch in der entsprechenden toctree-Direktive aufgelistet werden. Zum Beispiel::

    .. toctree::
       :maxdepth: 2
       :caption: Tutorials
       
       tutorial/installation
       tutorial/name_eures_artikels
       tutorial/pullreqguide



Doku lokal bauen
----------------

Die Doku auf readthedocs.io wird automatisch aus unserem GitHub-Repository gebaut. Wenn man sich die Doku aber lokal anschauen möchte braucht man dafür Sphinx.

Sphinx installieren
^^^^^^^^^^^^^^^^^^^

1. Über apt-get::

    apt-get install python-sphinx

2. Über pip (Hat man, wenn man Python installiert hat)::

    pip install sphinx

3. Oder man schaut auf der Seite von `sphinx <http://www.sphinx-doc.org/en/stable/install.html>`_.


Doku bauen
^^^^^^^^^^

Um jetzt die Doku zu bauen geht ihr in das root-Verzeichnis der Doku *docs* und führt::

    make html

aus. Dann werden in *_build/html* die Seiten generiert.
