# raspiBackup Dokumentation

<!-- Hinweis:
     Hier in der `README.md` und den anderen GitHub-Dateien wird *GitHub Flavored Markdown* verwendet.
     Siehe z.B. https://docs.github.com/de/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
-->

> [!NOTE]
> Diese Dokumentation entsteht gerade erst.
> Und zwar initial aus den Original-Texten der Webseite von framp.
>
> Die Dokumentation wird (mindestens) zweisprachig ausgeführt, zuerst Englisch und Deutsch.
> Zum Wechseln der Sprache wird oben rechts ein kleines Globus-Icon vorhanden sein.
>
> Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt",
> insbesondere bezüglich Formatierung und Verlinkung.
>
> **Also dies hier bitte im Moment als Prototyp sehen!**


## Der Plan

Die neue Dokumentation von raspiBackup könnte in Zukunft anders gestaltet sein.
Nicht mehr als integraler Bestandteil eines CMS (framps Joomla), sondern als eigenständiges
"Projekt".

Dafür bietet sich ein Repository mit thematisch aufgeteilten Dateien
in einer einfachen Auszeichnungssprache, z.B. *Markdown* an.

Dies sind Textdateien, die sich gut bearbeiten und versionieren lassen.
Über das Repository ist dann sogar eine Teamarbeit an der Dokumentation möglich (über *Pull-Requests*). ;-)

*Markdown* ist eine von vielen Auszeichnungssprachen,
die sich mit Hilfe von Software gut in andere Formate, z.B. auch eine Webseite, umwandeln lassen.

Um das Ergebnis in eine ansprechende und gut zu navigierende Form zu bringen,
ist natürlich noch etwas mehr "Drumherum" nötig, das nun kurz beschrieben wird.

Aktuell werden hier *mdbook* zum Generieren und *GitHub Pages* (bzw. ein normaler Webserver) zum Anzeigen verwendet.

Das könnte bei Bedarf Dank des Quelltext-Formats *Markdown* aber relativ leicht - auch nachträglich -
auf ein anderes Produkt umgestellt werden.
Mögliche Alternativen: [Sphinx](https://www.sphinx-doc.org/en/master/index.html), [MkDocs](https://www.mkdocs.org/), [readthedocs](https://readsthedocs.com/) und Einige mehr...

Bisher hat sich aber *mdbook* als sehr tauglich erwiesen.

## Weitere Details ...

  - [für Mitwirkende am Inhalt](CONTRIBUTE.md)
  - [für Maintainer](MAINTAIN.md)
  - [für Entwicker und technisch Neugierige](DEVELOPMENT.md)
