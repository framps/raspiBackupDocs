# Raspberry3 USB Boot Unterstützungstestmatrix

[.status]: todo "Links und Tabellen"

``` admonish note title="Quelle"
- <https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/490-raspibackup-raspberry3-usb-boot-unterstuetzungstestmatrix>
- <https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/489-raspibackup-raspberry3-support-test-matrix>
```


Es existieren die folgenden Umgebungsvarianten für *raspiBackup* in der
Release 0.6.2 welche die Raspberry3 auch im USB Boot unterstützt.

Weitere Neuerungen sind [auf dieser Seite](https://www.linux-tips-and-tricks.de/de/component/content/13-raspberry/432-raspibackup-versionshistorie?Itemid=303) beschrieben.
Der Testaufwand beschränkt die Anzahl der getesteten Variationen.
Wer immer eine Variante erfolgreich getestet hat, die hier
noch nicht als getestet markiert wurde wird gebeten, das in einem kurzen
Kommentar mitzuteilen, damit die Tabelle aktualisiert werden kann. Wer
sich nicht sicher ist, ob sein Benutzungszenario von *raspiBackup*
abgedeckt wurde, kann auch gerne nachfragen.

## Wie liest man die Tabellen?

Die Dimensionstabellen zeigen, welche Parameter den Backup- und
Restoreprozess beeinflussen. Für Backup ist es z.B.

1. Raspi version: Raspberry Version ist kleiner oder gleich 3

2 Boot device: Ob die Raspberry von SD Karte im USB boot mode von USB
Stick oder Platte gebootet wurde

3. Backup type: *raspiBackup* Typ (Option -t) - dd, tar oder rsync

4. Backup mode: *raspiBackup* Modus - Normal- oder partitionsorientiert
(Option -P)

5. External root partition: *raspiBackup* sichert eine externe
Rootpartition wenn sie von einer SD Karte gebootet wurde

 

Die Testbackupmatrix ist eine Untermenge der möglichen 32 Variationen:

Test# 1b liest sich wie folgt:

1\) Raspberry Version die zum Backuperstellen benutzt worden ist ist \<
3.

2\) Boot device war SD

3\) tar backup

4\) backup mode normal

5\) keine external Rootpartition, d.h. die Rootpartition liegt auf der
SD Karte

 

Die Testrestorematrix ist eine Untermenge der theretisch 64 möglichen
Variationen:

 

### Backup test variation dimensions

<table data-border="1">
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Raspi version</strong></td>
<td> <strong>Boot device<br />
</strong></td>
<td> <strong>backup type</strong></td>
<td> <strong>backup mode</strong></td>
<td><strong> external root partition</strong></td>
</tr>
<tr class="even">
<td> =3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> no</td>
</tr>
<tr class="even">
<td> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
</tr>
</tbody>
</table>

 

### Backup test matrix (Testabdeckung 13 of 19 = 68%)

<table style="width:100%;" data-border="1">
<colgroup>
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
<col style="width: 14%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Test#</strong></td>
<td><strong>Raspi version</strong></td>
<td><strong>Boot device<br />
</strong></td>
<td><strong>backup type</strong></td>
<td><strong>backup mode</strong></td>
<td><strong>external root partition</strong></td>
<td style="text-align: center;"><strong>Tested</strong></td>
</tr>
<tr class="even">
<td>1a1</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>1a2</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td>1a3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>1a4</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td>1b</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">no</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>2b</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">yes</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td>3b</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">no</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>4b</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">yes</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td>5b</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>6b</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td>7b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">no</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td>8b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">yes</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td>9b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">no</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td>10b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">yes</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td>11b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td>12b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td>13b</td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;">Duplicate</td>
</tr>
<tr class="odd">
<td>14b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">yes</td>
</tr>
<tr class="even">
<td>14b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">yes</td>
</tr>
<tr class="odd">
<td>16b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td>17b</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">USB</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">partition</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;"> yes</td>
</tr>
</tbody>
</table>

 

### Restore test variation dimensions

<table style="width:100%;" data-border="1">
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Backup Raspi version</strong></td>
<td> <strong>Restore Raspi version<br />
</strong></td>
<td><strong>Boot device</strong></td>
<td><strong>External root partition</strong></td>
<td><strong>Backup type</strong></td>
<td><strong>Backup mode</strong></td>
</tr>
<tr class="even">
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> yes</td>
<td style="text-align: center;">tar</td>
<td style="text-align: center;">normal</td>
</tr>
<tr class="odd">
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;">rsync</td>
<td style="text-align: center;">partition</td>
</tr>
<tr class="even">
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;"> </td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;"> </td>
</tr>
</tbody>
</table>

 

### Restore test matrix (Testabdeckung 7 of 19 = 37%)

<table data-border="1">
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Test#</strong></td>
<td><strong>Backup Raspi version</strong></td>
<td> <strong>Restore Raspi version<br />
</strong></td>
<td><strong>Boot device</strong></td>
<td><strong>External root partition<br />
</strong></td>
<td><strong>Backup type</strong></td>
<td><strong>Backup mode</strong></td>
<td><strong>Tested</strong></td>
</tr>
<tr class="even">
<td>0r1</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td>0r2</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td>0r3</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">&lt;3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td>0r4</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">=3</td>
<td style="text-align: center;">SD</td>
<td style="text-align: center;">N/A</td>
<td style="text-align: center;">dd</td>
<td style="text-align: center;">normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 1r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;">yes</td>
</tr>
<tr class="odd">
<td> 2r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td> 3r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td> 4r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="even">
<td> 5r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> no</td>
<td style="text-align: center;"> dd</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> yes</td>
</tr>
<tr class="odd">
<td> 6r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> yes</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 7r</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> SD</td>
<td style="text-align: center;"> yes</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td> 8r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 9r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;">yes</td>
</tr>
<tr class="odd">
<td> 10r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 11r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td> 12r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 13r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> tar</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="odd">
<td> 14r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> normal</td>
<td style="text-align: center;"> </td>
</tr>
<tr class="even">
<td> 15r</td>
<td style="text-align: center;"> =3</td>
<td style="text-align: center;"> &lt;3</td>
<td style="text-align: center;"> USB</td>
<td style="text-align: center;"> N/A</td>
<td style="text-align: center;"> rsync</td>
<td style="text-align: center;"> partition</td>
<td style="text-align: center;"> </td>
</tr>
</tbody>
</table>

</div>

