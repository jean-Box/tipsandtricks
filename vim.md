# VIM

vim fileName
i – Insert at cursor (goes into insert mode)
MAJ + G -> pour te positionner tout en bas,
gg -> pour te position tout en haut

VG -> pour selectionner visuellement jusqu'a la fin du fichier 
%y -> pour copier tout le contenu sans selection

ggVGy -> pour selectionner tout et copier 
ggVGd -> et supprimer
ggVGc -> et remplacer

Esc to enter commande mode
? pour la recherche

Shift+zz – Save the file and quit
:w – Save the file but keep it open
:q – Quit without saving
:wq – Save the file and quit


    i - Passer en mode insertion (avant le curseur)
    a - Passer en mode insertion (après le curseur)
    Esc - Revenir au mode normal
    :w - Enregistrer le fichier
    :q - Quitter Vim
    :wq ou ZZ - Enregistrer et quitter
    :q! - Quitter sans enregistrer
    h j k l - Déplacements basiques (gauche, bas, haut, droite)
    gg - Aller au début du fichier
    G - Aller à la fin du fichier
    0 - Aller au début de la ligne
    $ - Aller à la fin de la ligne
    w - Aller au début du mot suivant
    b - Aller au début du mot précédent
    e - Aller à la fin du mot
    dw - Supprimer un mot
    dd - Supprimer une ligne
    yy - Copier une ligne
    p - Coller après le curseur
    P - Coller avant le curseur
    u - Annuler la dernière action
    Ctrl+r - Refaire la dernière action annulée
    v - Passer en mode visuel (sélection)
    V - Sélectionner la ligne entière
    Ctrl+v - Sélection en bloc
    ggVG - Sélectionner tout le fichier
    > - Indenter la sélection
    < - Désindenter la sélection
    /mot - Rechercher "mot" vers l'avant
    ?mot - Rechercher "mot" vers l'arrière
    n - Trouver l'occurrence suivante
    N - Trouver l'occurrence précédente
    :%s/ancien/nouveau/g - Remplacer toutes les occurrences
    o - Insérer une nouvelle ligne en dessous et passer en mode insertion
    O - Insérer une nouvelle ligne au-dessus et passer en mode insertion
    x - Supprimer le caractère sous le curseur
    r - Remplacer un seul caractère
    cw - Changer un mot
    cc ou S - Changer toute la ligne
    ci" - Changer le texte entre guillemets
    zz - Centrer l'écran sur le curseur
    Ctrl+f - Descendre d'une page
    Ctrl+b - Monter d'une page
    ma - Marquer la position actuelle comme 'a'
    'a - Aller à la marque 'a'
    :split - Diviser horizontalement la fenêtre
    :vsplit - Diviser verticalement la fenêtre
    Ctrl+w puis flèche - Naviguer entre les fenêtres
    . - Répéter la dernière commande
    :help - Afficher l'aide
