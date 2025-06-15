# Arbeiten an/in/mit den Inhalten der Dokumentation

**Tipp**: Siehe auch Originalbeschreibung von *mdbook* <https://rust-lang.github.io/mdBook/guide/creating.html>

Alle Inhalte befinden sich standardmäßig in einem direkten Unterverzeichnis `src/`.

Da die Dokumentation von *raspiBackup* mehrsprachig aufgebaut ist,
befinden sich die Inhalte hier im Projekt sprachabhängig in den Unterverzeichnissen

    de/src/
    en/src/

In den (jeweiligen!) Verzeichnissen `src/` können bei Bedarf auch Bilder, Icons etc. untergebracht werden,
sinnvollerweise in passend benannten Unterverzeichnissen. Das heisst: Für jede Sprache extra.
Diese eventuelle mehrfache Speicherung von gleichen Dateien beruht auf der zugrundeliegenden Technik
und lässt sich zur Zeit nicht vermeiden.

Die eigentlichen Inhalte sind Textdateien (im *Markdown*-Format), die sich mit jedem Texteditor bearbeiten lassen.

Hilfreich ist ein Editor, der bei der Darstellung unterstützt ("Syntax Highlighting").
**TODO**: Beispiele.

Eine kurze Einführung zum verwendeten Generierungstool *mdbook* gibt es [hier](MDBOOK_INTRO.md).


## Das Inhaltsverzeichnis / Die Struktur der Dokumentation

Dies ist der wichtigste Teil der Dokumentation.

In der Datei `SUMMARY.md` wird die Struktur des zu erzeugenden Buches erfasst.
Und zwar durch einen "Baum" von (Markdown-)Links mit Kapitelnamen und den dazugehörigen Dateien im Filesystem (`*.md`).

Das bildet das Inhaltsverzeichnis!

Beispiel:

    # raspiBackup

    [Einführung](introduction.md)

    - [Installation]()
        - [Installation in 5 Minuten](installation-in-5-minutes.md)
        - [Updates]()
    - [Backup](backup.md)
    - [Restore]()

Wenn die Links dort schon Dateinamen enthalten, werden diese Dateien automatisch angelegt
und sie sind im Inhaltsverzeichnis anklickbar.

Bei leeren Links (wie oben z.B. bei `[Updates]()`) wird nur ein nicht anklickbarer Eintrag erzeugt.

Die Struktur wird also in beiden Fällen im Dokument schon gut sichtbar.

Die `SUMMARY.md` wird insbesondere auch zum Synchronisieren der verschiedenen Sprachversionen genutzt.
Deshalb sind die Dateinamen in Englisch und bei beiden Sprachen identisch!


## Die einzelnen Dateien/Kapitel

Die **Dateinamen** der Kapiteldateien bitte immer

  - englisch-sprachig
  - kurz und prägnant
  - ohne Leerzeichen, ohne Sonderzeichen
  - kleingeschrieben
  - mit der Endung `.md`

ausführen bzw. schon vorhandene Dateinamen nutzen.
Dann ist beim späteren Lesen der fertigen Dokumentation das Umschalten zwischen den Sprachen möglich.

Der **Inhalt** der Dateien ist mit der Auszeichnungssprache *Markdown* formatiert.

**Hinweis**: *mdbook* verwendet den Markdown-"Dialekt"
*Erweitertes CommonMark* (<https://rust-lang.github.io/mdBook/format/markdown.html>).

