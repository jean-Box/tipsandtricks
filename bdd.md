resync les sequences des BDD

UTILISATEUR : 

SELECT setVal('utilisateurs.t_utilisateur_uti_id_seq', 1 + (SELECT MAX(t_utilisateur.uti_id) FROM utilisateurs.t_utilisateur), true);
