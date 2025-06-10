# exim4 konfigurieren

Um z.B. Statusmails von *raspiBackup* als root zu versenden, kann nullmailer eingesetzt werden.

Folgende Variablen werden in der folgenden Beschreibung genutzt:

1. eMail Domain: MYDOMAIN (z.B. dummy.de)
2. Hostname des Servers: HOSTNAME (z.B. myserver)
3. smtp Hostname um eMails abzuliefern: SMTP_PROVIDER_HOST (z.B. mail.your-server.de)
4. Userid um emails zu senden: SMTP_INPUT_USERNAME
5. Password um emails zu senden: SMTP_INPUT_PASSWORD

## Änderungen bzw Einfügungen:

1. /etc/aliases: root: HOSTNAME@MYDOMAIN, dann sudo newaliases
2. /etc/mailname: MYDOMAIN
3. /etc/hostname: HOSTNAME.MYDOMAIN
4. /etc/email-addresses: root: HOSTNAME@MYDOMAIN
5. /etc/hosts: hosts:127.0.1.1 HOSTNAME HOSTNAME.MYDOMAIN
6. /etc/exim4/update-exim4.conf.conf

        dc_eximconfig_configtype='internet'
        dc_other_hostnames='localhost'
        dc_local_interfaces='127.0.0.1 ; ::1'
        dc_readhost='HOSTNAME.MYDOMAIN'
        dc_relay_domains=''
        dc_minimaldns='false'
        dc_relay_nets=''
        dc_smarthost='SMTP_PROVIDER_HOST'
        CFILEMODE='644'
        dc_use_split_config='false'
        dc_hide_mailname='true'
        dc_mailname_in_oh='true'
        dc_localdelivery='mail_spool'

        keep_environment=

7.  /etc/exim4/passwd.client

        SMTP_PROVIDER_HOST:SMTP_INPUT_USERNAME:SMTP_INPUT_PASSWORD



[.status]: todo "schöner formatieren"
[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/573-exim4-konfigurieren

