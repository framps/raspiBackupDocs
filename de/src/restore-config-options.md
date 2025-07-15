# Restore Konfigurationen

Die meisten Aufrufoptionen können ebenso in der Konfigurationsdatei
definiert werden. Siehe dazu [Restoreoptionen](restore-options.md).

<div class="table-wrapper-for-options">

------------------

<!-- toc -->

------------------

### DEFAULT_RESTORE_EXTENSIONS

Ab Version 0.6.7 gibt es auch für den Restore wie beim Backup die Möglichkeit,
auch pre und post Exits zu konfigurieren, um vor und nach dem Restore noch
irgendwelche Aktionen vorzunehmen. Die Syntax ist genauso wie für die Backup
Extensions.

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_RESTORE_EXTENSIONS |          |


### DEFAULT_RESTORE_REMINDER_INTERVAL

Backup Restore Test Reminder Intervall (Einheit: Monate)

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_RESTORE_REMINDER_INTERVAL | 6 |

### DEFAULT_RESTORE_REMINDER_REPEAT

Anzahl der Erinnerungen, einen Backup Restore Test durchzuführen.

| Config-Option              | Standard |
|----------------------------|----------|
| DEFAULT_RESTORE_REMINDER_REPEAT | 3   |

</div>

[.status]: restructured

