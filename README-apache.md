# Veröffentlichung auf einem Webserver

## .htaccess

Zur Webserverkonfiguration (Apache) ist noch eine Datei `.htaccess`
im Server-Ziel-Verzeichnis `raspiBackupDocs` erforderlich (Beispiel).

Dort wird eine individuelle Fehlerseite definiert:

    ErrorDocument 404 /raspiBackupDocs/404.html

Die Datei liegt hier lokal als `htaccess` (ohne führenden Punkt) vor und wird
beim Upload zum Webserver entsprechend umbenannt hochgeladen.
