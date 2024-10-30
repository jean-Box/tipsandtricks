# .ssh

## Arborescence cible

```
.ssh/
├── config
├── key/
│   ├── projet1/
│   │   ├── cle1-env1.key
│   │   └── cle2-env2.key   
│   └── projet2/
│       ├── cle1-env1.key
│       └── cle2-env2.key
└── config.d/
    ├── projet1.cfg
    ├── projet2.cfg
    └── projet3.cfg
```

### Créer le fichier config 
```bash
mkdir -p ~/.ssh/config && chmod 0700 ~/.ssh/config
```

Dans le fichier config ajouter `Include config.d/config.d` ce qui aura pour effet d'ajouter tout le contenu du répertoire dans la config ssh,
on peux alors facilement avoir un fichier de config par projet

### Créer le répertoire ou toutes les conf projet ce trouverons
```bash
mkdir -p ~/.ssh/config.d && chmod 0700 ~/.ssh/config.d
```

### Créer le 1er fichier de conf projet 
```bash
touch ~/.ssh/config.d/projet1.cfg && chmod 0600 ~/.ssh/config.d/projet1.cfg
```

Les droits

Attention SSH est très sensible (à juste titre) aux droits appliqués aux fichiers qu'il doit utiliser. 
Le répertoire .ssh tout comme le fichier config ne doit être accessible, lisible et modifiable qu'à l'utilisateur propriétaire.


## Les Clé Public 

Ne pas mettre les clés dans le config.d si tu mets une étoile dans le Include du config.d
Il faut pour ça qu'il faut créer répertoire keys dans .ssh avec un dossier par projet
```bash
mkdir -p ~/.ssh/key && chmod 0700 ~/.ssh/key

mkdir -p ~/.ssh/key/projet1 && chmod 0700 ~/.ssh/key/projet1

mkdir -p ~/.ssh/key/projet2 && chmod 0700 ~/.ssh/key/projet2
```

Dans ce fichier vous pouvez déclarer vos machine 

`~/.ssh/config.d/projet1.cfg`
```
PermitLocalCommand true
 
Host prj1-01-vm-*-dev
  LocalCommand echo -e "\n\n\t\e[1;43m\e[1;90m -- projet1 Dev -- \e[0m\n"
  IdentityFile ~/.ssh/key/projet1/projet1-dev.key

Host prj1-01-vm-*-pprd
  LocalCommand echo -e "\n\n\t\e[1;41m\e[1;97m --projet1 Preprod -- \e[0m\n"
  IdentityFile ~/.ssh/key/projet1/projet1-pp.key

Host prj1-*
  User monuser

# projet 1 Dev
Host prj1-01-vm-haproxy-01-dev
  ProxyJump prj1-01-vm-bastion-01-dev
Host prj1-01-vm-api-01-dev
  ProxyJump prj1-01-vm-bastion-01-dev
Host prj1-01-vm-application-01-dev
  ProxyJump prj1-01-vm-bastion-01-dev
Host prj1-01-vm-bdd-01-dev
  ProxyJump prj1-01-vm-bastion-01-dev
Host prj1-01-vm-bastion-01-dev
  ForwardAgent yes
  Hostname  10.10.10.10
```
