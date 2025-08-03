# nullmailer Konfiguration

Um z.B. Statusmails von *raspiBackup* als root zu versenden, kann *nullmailer* eingesetzt werden.

Folgende Variablen werden in der folgenden Beschreibung genutzt (Provider ist Hetzner):

  - eMail Domain: MYDOMAIN (z.B. dummy.de)
  - Hostname des Servers: HOSTNAME (z.B. myserver)
  - smtp Hostname um eMails abzuliefern: SMTP_PROVIDER_HOST (z.B. mail.your-server.de)
  - Userid um emails zu senden: SMTP_INPUT_USERNAME
  - Password um emails zu senden: SMTP_INPUT_PASSWORD


## Änderungen bzw Einfügungen:

1. `/etc/nullmailer/remotes`: SMTP_PROVIDER_HOST smtp --auth-login --user=SMTP_INPUT_USER --pass=SMTP_INPUT_PASSWORD --ssl
2. [Nullmailer Rewrite Wrapper](https://github.com/JsBergbau/nullmailer-Rewrite-Wrapper) installieren und konfigurieren.
   Dabei NULLMAILER_USER=SMTP_INPUT_USER und NULL_MAILER_HOST=MYDOMAIN in "sendmail" setzen.
3. `sudo chown 700 /usr/sbin/sendmail`
4. Installation von mail: `sudo apt install mailutils -y`

2 und 3 sind nur notwendig, wenn der Hostname kein gültiger Hostname beim eMailProvider ist.


[.status]: rst
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/675-nullmailer-konfigurieren
