# raspiBackup Dokumentation


> [!NOTE]
> Diese Dokumentation entsteht gerade erst. Und zwar initial aus den Original-Texten der Webseite von framp.
>
> Aktuell ist die Struktur noch nicht final und auch viele Seiten noch "kaputt", insbesondere bezüglich Formatierung und Verlinkung.
>
> **Also bitte im Moment als Prototyp sehen!**
>
> Die generierte Dokumentation ist über folgenden Link zu erreichen:
>
>   - TODO


## Der Plan

Die neue Dokumentation von raspiBackup könnte in Zukunft als eine Sammlung von thematisch aufgeteilten Dateien im Markdown-Format vorliegen.

Dies sind Textdateien, die sich gut bearbeiten und, zum Beispiel mit *git*, versionieren lassen.
Über ein Repository wäre dann auch eine Teamarbeit an der Dokumentation möglich (über *Pull-Requests*).

*Markdown* ist eine von vielen Auszeichnungssprachen, die sich mit Hilfe von Software gut in andere Formate umwandeln lassen.

Um das Ergebnis in eine ansprechende und gut zu navigierende Form zu bringen, ist natürlich noch etwas mehr "Drumherum" nötig.

> [!NOTE]
> Im folgenden nutze ich den Verzeichnis-/Projektnamen bzw. Teil der URL **raspiBackupDocs** an verschiedenen Stellen.
> Das ist natürlich an die eigenen Bedürfnisse anpassbar.


### Arbeitsablauf

Der  Arbeitsablauf ist dann folgendermaßen:

#### ... für den Repo-Eigentümer und Webserver-Admin

  1. Editieren von Markdown-Datei(en)
  1. lokales Generieren der Webseite(n) (Zielverzeichnis ist jeweils `book` in den Sprachverzeichnissen.)

         mdbook build en     # "en" ist Default und Fallback
         mdbook build de     # "de" ist eine von evtl. mehreren zusätzlichen Übersetzungen

     Testen mit einem lokalen Development-Webservice im Broweser: http://localhost:3000  
     Da `mdbook serve` bei jeder Änderung der Quelldateien intern ein 'build' aufruft,
     kann lokal nur jede Sprache einzeln getestet werden.

         mdbook serve en

     beziehungsweise

         mdbook serve en

  1. Hochladen der Webseite zu einem Webserver

     Beispiel siehe unten bei [Hochladen der Webseite zu einem Webserver](upload)

  1. commit / push



#### ... für andere Nutzer, die etwas beitragen möchten

  1. Das Repository clonen/forken
  1. Editieren von Markdown-Datei(en), lokal oder im Browser
  1. commit / push
  1. Pull-Request (PR) erstellen
  1. warten, bis der Repo-Owner den PR annimmt  ;-)



### Webserver

#### .htaccess

Zur Webserverkonfiguration (Apache) ist noch eine Datei `.htaccess`
im Server-Ziel-Verzeichnis `raspiBackupDocs` erforderlich (Beispiel).

hauptsächlich wird dort eine individuelle Fehlerseite definiert:

    ErrorDocument 404 /raspiBackupDocs/404.html

Außerdem könnten dort noch Redirects/Rewrites definiert werden,
durch die Besucher, die in ihrem Browser die "bevorzugte Sprache" für Webseiten
auf "de[...]" stehen haben, direkt zur deutschsprachigen Version geleitet werden.
Alle anderen Besucher zur englischsprachigen Version.

Leider gibt das (noch) kleine Probleme bei nicht gefundenen Seiten.
Deshalb ist das zur Zeit auskommentiert.

    # RewriteEngine on
    #
    # RewriteCond %{HTTP:Accept-Language} ^de [NC]
    # RewriteCond %{REQUEST_URI} ^/raspiBackupDocs/$ [NC]
    # RewriteRule .* /raspiBackupDocs/de/ [L,R=301]



Die Datei liegt hier lokal als `htaccess` (ohne führenden Punkt) vor und wird
beim Upload zum Webserver entsprechend umbenannt hochgeladen.


<a name="upload"></a>
#### Hochladen der Webseite zu einem Webserver

Hier eine mögliche Variante mit `lftp` zum Hochladen der Webseite(n):

Hinweis: Reihenfolge des Sprachen-Uploads beachten!

    lftp sftp://${WEBSERVER} -e "cd ${WEBSERVER_ROOTDIR} ; rm -r raspiBackupDocs; mirror -R en/book raspiBackupDocs; cd raspiBackupDocs ; mirror -R de/book de ; put htaccess -o .htaccess ; dir ; quit"


### Arbeiten an/in/mit dem Buch

Siehe <https://rust-lang.github.io/mdBook/guide/creating.html>

> [!NOTE]
> *mdbook* verwendet den Markdown-"Dialekt"
> Erweitertes CommonMark (<https://rust-lang.github.io/mdBook/format/markdown.html>),
> der sich vom hier in der `README.md` verwendeten *GitHub Flavored Markdown* etwas unterscheidet!


#### Das Inhaltsverzeichnis / Die Struktur des Buches

In der Datei `src/SUMMARY.md` (Groß-/Kleinschreibung ist relevant!) wird die Struktur des zu erzeugenden Buches erfasst.
Und zwar durch einen "Baum" von Links mit Kapitelnamen und den dazugehörigen Dateien im Filesystem (src/*.md).

Das entspricht dem zukünftigen Inhaltsverzeichnis.

Beispiel:

    # raspiBackup

    [Einführung](einfuehrung.md)

    - [Installation]()
        - [Installation in 5 Minuten](installation-in-5-minuten.md)
        - [Updates]()
    - [Backup]()
    - [Restore]()

Wenn dort die Links schon Dateinamen enthalten, werden diese Dateien automatisch angelegt
und sie sind im Inhaltsverzeichnis anklickbar.

Bei leeren Links (wie bei `[Updates]()`) wird nur ein nicht anklickbarer Eintrag erzeugt,
die Struktur also auch im HTML-Dokument gut sichtbar

-----------------------------

**Das war es eigentlich auch schon für das "normale" Arbeiten an der Dokumentation.**

Entwicker und technisch Neugierige finden in [DEVELOPMENT.md](DEVELOPMENT.md) weitere Informationen.

