# LDAP

## Tuto

[www.n0tes.fr](https://www.n0tes.fr/2022/12/28/Commande-ldapsearch/)


## Outils

[https://directory.apache.org](https://directory.apache.org/studio/download/download-linux.html)


## request

```bash
ldapsearch -x -D "uid=search-user,ou=People,dc=example,dc=com" \
           -W -H ldap://ldap.example.com \
           -b "ou=People,dc=example,dc=com" \
           -s sub 'uid=test-user'
```
    
-D - Use bind user "search-user"   
-W - Prompt for password   
-H - URL of LDAP server. Non-SSL in this case; use "ldaps://" for SSL   
-b - The search base   
-s - Search scope - i.e. base for base of tree, one for on level down and sub for recursively searching down the tree (can take a while)   
Finally the search filter as a non-option argument. In this case we will search for the uid of "test-user"   

```bash
ldapsearch -x -D "cn=app,ou=applications,ou=aaa,ou=bbb,o=ccc,c=fr" -H "ldap://annuaire" -w "password" -b "ou=app,ou=aaa,ou=bbb,o=ccc,c=fr" uid=jean
```
