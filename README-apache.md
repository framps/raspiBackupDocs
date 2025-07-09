# Veröffentlichung auf einem Webserver

## .htaccess

Zur Webserverkonfiguration (Apache) ist noch eine Datei `.htaccess`
im Server-Ziel-Verzeichnis `raspiBackupDoc` erforderlich (Beispiel).

Dort wird eine individuelle Fehlerseite definiert:

    ErrorDocument 404 /raspiBackupDoc/404.html

Die Datei liegt hier lokal als `data/htaccess` (ohne führenden Punkt) vor und wird
beim Upload zum Webserver entsprechend umbenannt hochgeladen.
