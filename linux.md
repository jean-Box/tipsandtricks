
## linux

droit root -> sudo bash

### lecture fichier dans la cmd

`tail -f /var/opt/application/oc/log/log.xml`   

### changement propriétaire

`chown dla:dla file.txt`   

### changement propriétaire dossier avec enfants

voir les droit en numérique   
`stat -c %a /home/dla/scripts/installWarWithPrompt.sh`   
`chown -R dla:dla /var/opt/data/flat/sdrp/`    
`chmod -R 755 /home/dla/scripts/installWarWithPrompt.sh`   

### recherche text via ? letextachercher

`vim /opt/application/dla/logs/PORTAL-GUI.log`   

N pour le Next text qui match ton pattern de recherche   

vim fileName   
i – Insert at cursor (goes into insert mode)   
MAJ + G pour te positionner tout en bas,   
gg pour te position tout en haut   

Esc to enter commande mode   
? pour la recherche   

Shift+zz – Save the file and quit   
:w – Save the file but keep it open   
:q – Quit without saving   
:wq – Save the file and quit   

platforme X86 or I386 -> uname -a   
distribution is in use -> cat /etc/*release   
to know witch port is in use -> ss -tulw   

### renomer un fichier 

`mv /var/opt/filetxt /var/opt/newfile.txt`   

### vidé un fichier

`truncate -s 0 /var/opt/application/log/GUI.log`   

### lien symbolique

`readlink -f app.war /opt/application/app/version/war/app-1.1.0.4-sprint38_9.war`   

## ajouter une clé ssh 

les fichier doivent être chmod 600 -rw-------
ssh-add -D
ssh-add /home/user/.ssh/ansible.key

## quiter la session utilisateur 
`exit`
ou racourci clavier 
Ctrl + D


## Stat ubuntu

https://www.lemagit.fr/conseil/Cinq-commandes-Linux-pour-monitorer-les-performances-des-serveurs

## htop
Cmd de stat de la machine ram / cpu ...
```
htop
```

## iostat 
stat de disque dure

`sudo apt-get install sysstat`
5 captures toutes les 2s   
`iostat -t 2 5`

## session rdp
pour voir les instances fantomes de sessions rdp
```
ps -ef | grep -i rdp 
```

à tuer avec 
```
kill -9 <no_pid>
```
