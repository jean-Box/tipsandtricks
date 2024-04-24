
## Postresql

## SGBD 
des soucis de droit bloque l'enregistrement des pwd sous linux avec inteliJ

`jdbc:postgresql://localhost:5432/bdd-name?currentSchema=public&user=postgres&password=postgres`
 
### User postgre par defaut
`su - postgres`

### Voir les instance qui tourne

`ps -aux | grep pg`   

### dans l'instance postresql

`\c dbtruc` -> ce connecter a une bdd   
`\d` -> affiche toute les table de la bdd   
`\dn` -> list les schema d'une BDD   
`\dt public.*` -> toutes les table sous le schema public   

`pg_ctl status`   
`pg_ctl start`   

### clean archive

`find /pgqdata/pgoverlay/arch/ -type f -mtime +10 -exec rm {} \;`   

### request

`psql -U postgres -h localhost`   
`psql -h 127.0.0.1 -d overlaycontroller  -c 'SELECT * FROM OVERLAYCONTROLLER;'`   
`psql -h 127.0.0.1 -d live -c 'SELECT * FROM live.t_chaine;'`   


### Fichier conf
`sudo finf / -name ph_hba.conf`   
`vim /pgdata/data/pg_hba.conf`   

## Installer les modification

### Exécuter les commandes suivantes :

Se connecter avec l'utilisateur postgres : `su - postgres`   
Sélectionner la bonne instance PostgreSQL :

Pour se positionner sur un environnement PostgreSQL : faire '. pgqenv'   
Ensuite taper le numéro de la bonne instance PostgreSQL en fonction de votre besoin***   
Lancer la migration de la BDD concernée : psql -h 127.0.0.1 -d {BDD_NAME} -f {EMPLACEMENT_FICHIER_MIGRATION}   
Exemple : psql -h 127.0.0.1 -d bddname -f /opt/pgsql/scripts/sprint44/upgrade_table__Postgres.sql   



[]$psql -h 127.0.0.1 -d bddname -f /opt/pgsql/scripts/sprint44/upgrade_table_G06R05C01P00_Postgres.sql   
/opt/pgsql/scripts/sprint44/upgrade_table__Postgres.sql: Permission denied	   
il faut rendre postgres proprietaire des scripts. tu les as peut etre crées avec root   

[root@]# chown postgres:postgres /opt/pgsql/   
[root@]# chown postgres:postgres /opt/pgsql/scripts/    
[root@]# chown postgres:postgres /opt/pgsql/scripts/sprint44/   
 
[root@]# chown postgres:postgres /opt/pgsql/scripts/sprint44/upgrade_table__Postgres.sql    
[root@]# chown postgres:postgres /opt/pgsql/scripts/sprint44/downgrade_table__Postgres.sql   
