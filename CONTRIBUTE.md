# Mitwirken an der Dokumentation

Leser/Nutzer, die etwas zur Dokumentation beitragen möchten,
können dies folgendermaßen tun (Kurzfassung):

## Vorschläge machen, Probleme melden usw.

Bitte einen "Issue" bei *GitHub* anlegen: <https://github.com/rpi-simonz/raspiBackupDocs/issues>


## Sich über die Doku mit anderen Nutzern austauschen

Im *Raspberry Pi Forum*, Unterforum "raspiBackup": <https://forum-raspberrypi.de/forum/board/164-raspibackup/>


## Inhalte ändern, ergänzen oder neu erstellen

  1. Das Repository kopieren, wahlweise
       - online bei GitHub: "Fork"
       - lokal: `git clone https://github.com/rpi-simonz/raspiBackupDocs.git`

  1. Editieren von Markdown-Datei(en) in Verzeichnis `<sprache>/src/`
       - online: im Browser
       - lokal: mit einem beliebigen Editor

     Zum Aufbau der Markdown-Dateien siehe [EDIT.md](EDIT.md)

  1. Eine neue Version erstellen
       - online: "Commit"
       - lokal: `git commit ...` && `git push ...`

  1. Pull-Request (PR) erstellen
       - online: "Create pull request"

  1. warten, bis der Repo-Owner den PR annimmt  ;-)

----

### Beschreibung obiger "online"-Schritte bei GitHub

1. Erzeugen eines Forks des Original-Repository

   ![Erzeugen eines Forks des Original-Repos-1](readme-images/01-create-fork-from-original-repo-1.png)
   ![Erzeugen eines Forks des Original-Repos-2](readme-images/02-create-fork-from-original-repo-2.png)

1. Im neu erzeugten Fork im eigenen Repository zu einer zu editierenden Datei navigieren

   ![Im neu erzeugten Fork](readme-images/03-being-in-forked-repo-now.png)
   ![Navigieren zu einer Datei](readme-images/04-navigate-to-a-source-file.png)
   ![Datei auswählen](readme-images/05-select-a-file.png)

   Diese editieren, dann committen

   ![Editieren anklicken](readme-images/06-click-edit.png)
   ![Editieren und commiten](readme-images/07-edit-and-commit.png)

1. und in einem neuen Branch speichern

   ![Commit-Meldung ausfüllen und branchen](readme-images/08-fill-commit-message-and-branch.png)

1. Dann daraus den *Pull Request* erstellen

   ![Änderungen ansehen und PR erstellen](readme-images/09-view-changes-and-create-pr.png)
   ![Beschreibung ausfüllen und PR erstellen](readme-images/10-fill-description-and-create-pr.png)

