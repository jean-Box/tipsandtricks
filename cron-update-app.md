# cron for update app on linux

autoUpdateWithCron.sh -> rendre ce fichier executable (-rwxr-xr-x)

met à jour Visual Studio Code (vscode, vsc)

```bash
date
sudo apt-get update
sudo apt-get install code
date
```

## CRON

tous les jours a 12h on fait l'update

```bash
0 12 * * * /home/dlafossas-consulta01/Bureau/autoUpdateWithCron.sh >> /tmp/autoUpdateWithCron.log
```

tous les mardi a 12h30 on clean le fichier de log

```bash
30 12 * * 2 truncate -s 0 /tmp/autoUpdateWithCron.log
```

 */5 * * * * sudo apt-get && update sudo apt-get install code  >> /tmp/autoUpdateWithCron.log
 */1 * * * * date && sudo apt-get update && sudo apt-get install code && date >> /tmp/autoUpdateWithCron.log
