# Arbeiten an/in/mit den Inhalten der Dokumentation

Alle Inhalte befinden sich standardmäßig in einem direkten Unterverzeichnis `src/`.

Da die Dokumentation von *raspiBackup* mehrsprachig aufgebaut ist,
befinden sich die Inhalte hier im Projekt sprachabhängig in den Unterverzeichnissen

    de/src/
    en/src/

In den (jeweiligen!) Verzeichnissen `src/` können bei Bedarf auch Bilder, Icons etc. untergebracht werden,
sinnvollerweise in passend benannten Unterverzeichnissen. Das heisst: Für jede Sprache extra.
Diese eventuelle mehrfache Speicherung von gleichen Dateien beruht auf der zugrundeliegenden Technik
und lässt sich zur Zeit nicht vermeiden.

Beispiel:

    ├── de
    │   ├── book.toml
    │   ├── src
    │   │   ├── 10-years-raspibackup.md
    │   │   ├── images
    │   │   │   ├── CM4.jpg
    │   │   │   ├── icons
    │   │   │   │   └── ...
    │   │   │   └── ...
    │   │   ├── installation.md
    │   │   ├── SUMMARY.md
    │   │   └── ...

Die eigentlichen Inhalte sind Textdateien (im *Markdown*-Format), die sich mit jedem Texteditor bearbeiten lassen.

Hilfreich ist ein Editor, der bei der Darstellung unterstützt ("Syntax Highlighting").

Eine kurze Einführung zum verwendeten Generierungstool *mdbook* gibt es [hier](MDBOOK_INTRO.md).

**Tipp**: Siehe auch Originalbeschreibung von *mdbook* <https://rust-lang.github.io/mdBook/guide/creating.html>


## SUMMARY.md - Das Inhaltsverzeichnis / Die Struktur der Dokumentation

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

Wie der Name "Erweitertes Commonmark" ahnen lässt, bietet es zusätzliche Features.

Eines davon sind [Link-Referenzen](https://spec.commonmark.org/0.31.2/#link-reference-definitions).

Diese werden zur leichteren Verlinkung (z.B. bei Mehrfachnennung) eingesetzt:

```
Siehe in [hier](ein_langer_pfad_und_dateiname_zum_hinweis23.md "Wichtigster Hinweis! Bitte beachten")
Bla, blubb ...
Und nicht vergessen: siehe [hier](ein_langer_pfad_und_dateiname_zum_hinweis23.md "Wichtigster Hinweis! Bitte beachten")
```

kann damit übersichtlicher werden zu (Achtung, andere Klammerung beachten!):

```
Siehe in [hier][hinweis23]
Bla, blubb ...
Und nicht vergessen: siehe [hier][hinweis23]


Und irgendwo auf der Seite dann:

[hinweis23]: ein_langer_pfad_und_dateiname_zum_hinweis23.md "Wichtigster Hinweis! Bitte beachten"
[hinweis24]: ein_pfad_und_dateiname.md
```

Die Definitionen bestehen aus `[name]: Linkadresse` bzw.
mit optionalem Link-Titel: `[name]: Linkadresse "Link Title"`.


### Spezielle hier in diesem Projekt genutzte Dinge

Um die Arbeit an den Inhalten der Dateien und auch an den Übersetzungen besser organisieren zu können,
gibt es in diesem Projekt in vielen Markdown-Dateien ergänzende "Tags", Markierungen, Kommentare.

Da *Markdown* aber nativ keine Kommentare unterstützt, werden oben beschiebene *Commonmarks Link References* zweckentfremdet.
Allerdings muss die Syntax auch dann eingehalten werden: `[name]: Linkadresse "Link Title"`.

Um diese Spezial-Nutzung, also die gewünschte Unsichtbarkeit für den normalen Nutzer,
deutlich zu machen, beginnen die Namen mit einem Punkt `.`.

Bei einheitlicher Benennung lassen sich damit auch `grep` oder andere Tools
(vimgrep,...) einsetzen, um die Dokumentenmenge im Griff zu haben.

Der optionale Linktitel (in `""`!) lässt sich für etwas längeren (also mehrwortigen) Text nutzen.

> [!NOTE]
> Zur weiteren Unterstützung der Autoren sind kleine Tools entstanden.
>
> Einige davon befinden sich in der Datei `.cdprc`,
> die nur gesource'd werden muss und so einige Aliases definiert:
>
>   - zur Auswahl von Datei(en) mit einem gewünschten Status
>   - noch zu übersetzende/schon übersetzte Dateien in parallelen Editor-Fenstern
>   - Synchronisierung der SUMMARY.md in den beiden Sprachen
>
> `.cdprc` ist Teil des Tools [cdp - "cd project"](https://github.com/rpi-simonz/cdp) von *rpi-simonz*,
> kann aber auch wie beschrieben eigenständig verwendet werden.


Hier einige Beispiele:

#### Angabe von Referenzen auf Übersetzungs- oder Quelldateien

```
[.de]: ../../de/src/10-years-raspibackup.md

[.source]: https://linux-tips-and-tricks.de/de/anwendungstipps
```

#### Angaben zum Status der jeweiligen Datei

```
[.status]: done
[.status]: todo
[.status]: todo "z.B.: Links überprüfen und Formatierung optimieren"
[.status]: wip "Work in progress by ..."

[.status]: review-needed
[.status]: rft "Ready for translation"
[.status]: rft
[.status]: translated
```

#### weitere variable Anwendungsmöglichkeiten

```
[.workaround]: _ "Probleme beim Syntax-Highlighting in vim-markdown bei non-balanced-underlines"
```

