# Arbeiten an/in/mit den Inhalten der Dokumentation

**Tipp**: Siehe auch Originalbeschreibung von *mdbook* <https://rust-lang.github.io/mdBook/guide/creating.html>

Alle Inhalte befinden sich sprachabhängig in den Unterverzeichnissen

    `de/src/`
    `en/src/`

Es sind Textdateien (im *Markdown*-Format), die sich mit jedem Texteditor bearbeiten lassen.

Hilfreich ist aber ein Editor, der bei der Darstellung unterstützt. **TODO**: Beispiele.


## Das Inhaltsverzeichnis / Die Struktur der Dokumentation

Dies ist der wichtigste Teil der Dokumentation,
insbesondere auch zum Synchronisieren der verschiedenen Sprachversionen.

In der Datei `SUMMARY.md` wird die Struktur des zu erzeugenden Buches erfasst.
Und zwar durch einen "Baum" von (Markdown-) Links mit Kapitelnamen und den dazugehörigen Dateien im Filesystem (`*.md`).

Das bildet das zukünftige Inhaltsverzeichnis!

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

Die Struktur wird also in jedem Fall im Dokument schon gut sichtbar.


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
