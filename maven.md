Depuis un invite de commandes exécuter la commande de génération du mot de passe chiffré :

```batch
mvn -Dsettings.security="C:\maven\v3.5.2\conf\settings-security.xml" --encrypt-password "XXXXXX"
```

```batch
mvn versions:set -DnewVersion=1.0.3-SNAPSHOT
```

```batch
mvn release:clean release:prepare -B -DpomFileName=pom.xml --batch-mode -DskipTests -Darguments=-DskipTests -Pprod,no-tests -Dusername=jean -Dpassword=glpat
```
