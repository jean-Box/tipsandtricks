resync les sequences des BDD

LIVE :

SELECT setVal('LIVE.T_EDITO_EDI_ID_seq', 1 + (SELECT MAX(EDI_ID) FROM LIVE.T_EDITO), true);

UTILISATEUR : 

SELECT setVal('utilisateurs.t_utilisateur_uti_id_seq', 1 + (SELECT MAX(t_utilisateur.uti_id) FROM utilisateurs.t_utilisateur), true);
SELECT setVal('utilisateurs.t_config_profils_prf_id_seq', 1 + (SELECT MAX(t_config_profils.prf_id) FROM utilisateurs.t_config_profils), true);
SELECT setVal('utilisateurs.t_config_chaines_cha_id_seq', 1 + (SELECT MAX(t_config_chaines.cha_id) FROM utilisateurs.t_config_chaines), true);
SELECT setVal('utilisateurs.t_config_occultation_goc_id_seq', 1 + (SELECT MAX(t_config_occultation.goc_id) FROM utilisateurs.t_config_occultation), true);
SELECT setVal('utilisateurs.t_token_acces_ihm_tai_id_seq', 1 + (SELECT MAX(t_token_acces_ihm.tai_id) FROM utilisateurs.t_token_acces_ihm), true);
