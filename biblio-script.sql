CREATE DATABASE bibliotheque;
USE bibliotheque;
CREATE TABLE abonne (
num_matricule INT PRIMARY KEY,
nom VARCHAR(50),
prenom VARCHAR(50),
date_naissance DATE,
date_adhesion DATE,
cat_sociaux_pro VARCHAR(50)
);
CREATE TABLE auteur (
id_auteur INT PRIMARY KEY,
nom VARCHAR(50),
prenom VARCHAR(50)
);
CREATE TABLE edition (
id_editeur INT PRIMARY KEY,
nom VARCHAR(50),
annee YEAR
);
CREATE TABLE genre (
id_genre INT PRIMARY KEY,
libelle_genre VARCHAR(50)
);
CREATE TABLE mots_cle (
id_mot INT PRIMARY KEY,
mot VARCHAR(50)
);
CREATE TABLE livres (
code_catalogue INT PRIMARY KEY,
titre VARCHAR(50),
code_auteur INT,
FOREIGN KEY (code_auteur) REFERENCES auteur(id_auteur),
code_editeur INT,
FOREIGN KEY (code_editeur) REFERENCES edition(id_editeur),
code_genre INT,
FOREIGN KEY (code_genre) REFERENCES genre(id_genre),
code_mot INT,
FOREIGN KEY (code_mot) REFERENCES mots_cle(id_mot),
num_abonne INT,
FOREIGN KEY (num_abonne) REFERENCES abonne(num_matricule),
date_dispo DATE
);
CREATE TABLE exemplaire (
code_rayon INT,
code_cat INT,
FOREIGN KEY (code_cat) REFERENCES livres(code_catalogue),
num_abonne INT,
FOREIGN KEY (num_abonne) REFERENCES abonne(num_matricule),
code_usure INT,
date_emprunt DATE,
date_retour DATE,
date_achat DATE,
mise_au_rebur DATE,
PRIMARY KEY (code_rayon, code_cat)
);
