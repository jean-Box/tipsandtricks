Capturer et analyser les paquets réseau
Exemple de commande pour capturer tous les paquets réseau transitant entre la machine locale et n'importe quelle destination :

```bash
tcpdump -i eth0 -w exemple_fichier.pcap
```

```bash
tcpdump -i eth1 port 8080 -vv
```

Ctrl + C pour terminer la capture

Télécharger et ouvrir le fichier .pcap dans Wireshark et ajouter des filtres selon le besoin (par exemple "http", "ip.dest", ...)
