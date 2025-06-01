# Veröffentlichung auf einem Webserver

## .htaccess

Zur Webserverkonfiguration (Apache) ist noch eine Datei `.htaccess`
im Server-Ziel-Verzeichnis `raspiBackupDocs` erforderlich (Beispiel).

hauptsächlich wird dort eine individuelle Fehlerseite definiert:

    ErrorDocument 404 /raspiBackupDocs/404.html

Außerdem könnten dort noch Redirects/Rewrites definiert werden,
durch die Besucher, die in ihrem Browser die "bevorzugte Sprache" für Webseiten
auf "de[...]" stehen haben, direkt zur deutschsprachigen Version geleitet werden.
Alle anderen Besucher zur englischsprachigen Version.

Leider gibt es damit (noch) kleine Probleme bei nicht gefundenen Seiten.
Deshalb ist das zur Zeit auskommentiert.

    # RewriteEngine on
    #
    # RewriteCond %{HTTP:Accept-Language} ^de [NC]
    # RewriteCond %{REQUEST_URI} ^/raspiBackupDocs/$ [NC]
    # RewriteRule .* /raspiBackupDocs/de/ [L,R=301]


Die Datei liegt hier lokal als `htaccess` (ohne führenden Punkt) vor und wird
beim Upload zum Webserver entsprechend umbenannt hochgeladen.

## to be continued ...
