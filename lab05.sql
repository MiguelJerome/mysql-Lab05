-- Supprimer la base de données si elle existe 
DROP DATABASE IF EXISTS lab05; 
 
-- Créer la base de données 
CREATE DATABASE lab05  
CHARACTER SET utf8mb4  
COLLATE utf8mb4_unicode_ci; 
 
-- Utiliser la base de données pour le reste des opérations 
USE lab05;

-- Créer la saison
DROP TABLE IF EXISTS saison;
CREATE TABLE saison(
    id_saison INT AUTO_INCREMENT,
    saison VARCHAR(10),
    CONSTRAINT PRIMARY KEY(ID_saison)
);

-- Créer le cours
DROP TABLE IF EXISTS cours;
CREATE TABLE cours(
    code_cours CHAR(9),
    nom VARCHAR(50),
    description TEXT,
    CONSTRAINT PRIMARY KEY(code_cours)
);

-- Créer le cours programme
DROP TABLE IF EXISTS cours_programme;
CREATE TABLE cours_programme(
    code_cours CHAR(9),
    id_programme INT,
    CONSTRAINT PRIMARY KEY(code_cours, id_programme)
);

ALTER TABLE cours_programme 
    ADD CONSTRAINT fk_cours_programme_cours
    FOREIGN KEY(code_cours)
    REFERENCES cours(code_cours);
    ON DELETE RESTRICT
    On UPDATE CASCADE;
  
ALTER TABLE cours_programme   
    ADD CONSTRAINT fk_cours_programme_programme
    FOREIGN KEY(id_programme)
    REFERENCE programme(id_programme);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Créer le programme
DROP TABLE IF EXISTS programme;
CREATE TABLE programme(
    id_programme INT AUTO_INCREMENT,
    nom VARCHAR(50),
    CONSTRAINT PRIMARY KEY(id_programme)
);

-- Créer le semestre
DROP TABLE IF EXISTS semestre;
CREATE TABLE semestre(
    id_semestre INT AUTO_INCREMENT,
    id_season INT,
    annee YEAR,
    CONSTRAINT PRIMARY KEY(id_semestre)
);

ALTER TABLE semestre  
    ADD CONSTRAINT fk_semetre_saison
    FOREIGN KEY(id_saison)
    REFERENCE saison(id_saison);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Créer la classe
DROP TABLE IF EXISTS classe;
CREATE TABLE classe(
    id_classe INT AUTO_INCREMENT,
    id_semestre INT,
    code_cours CHAR(9),
    CONSTRAINT PRIMARY KEY(id_classe)
);

ALTER TABLE classe 
    ADD CONSTRAINT fk_classE_semestre
    FOREIGN KEY(id_semestre)
    REFERENCE semestre(id_semestre);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE classe 
    ADD CONSTRAINT fk_classe_cours
    FOREIGN KEY(code_cours)
    REFERENCE cours(code_cours);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Créer l'etudiant
DROP TABLE IF EXISTS etudiant
CREATE TABLE etudiant(
    no_etudiant CHAR(7),
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    telephone CHAR(14),
    note_moyenne FLOAT,
    CONSTRAINT PRIMARY KEY(no_etudiant)

    CONSTRAINT ck_note_moyenne CHECK(
        note_moyenne >= 0 AND note_moyenne <= 100
    )
);

-- Créer la classe professeur
DROP TABLE IF EXISTS classe_professeur
CREATE TABLE classe_professeur(
    id_classe INT,
    no_professeur CHAR(7),
    CONSTRAINT PRIMARY KEY(id_classe, no_professeur)
);

ALTER TABLE classe_professeur
    ADD CONSTRAINT fk_id_classe_professeur_classe
    FOREIGN KEY(id_classe)
    REFERENCE cours(id_classe);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE classe_professeur
    ADD CONSTRAINT fk_classe_professeur_professeur
    FOREIGN KEY(no_professeur)
    REFERENCE professeur(no_professeur);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Créer le professeur
DROP TABLE IF EXISTS professeur
CREATE TABLE professeur(
    no_professeur CHAR(7),
    prenom VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    nas CHAR(9),
    CONSTRAINT PRIMARY KEY(no_professeur)
);

-- Créer la classe etudiant
DROP TABLE IF EXISTS classe_etudiant
CREATE TABLE classe_etudiant(
    id_classe INT,
    no_etudiant CHAR(7),
    note FLOAT,
    CONSTRAINT PRIMARY KEY(id_classe, no_etudiant)
    CONSTRAINT ck_note CHECK(
        note >= 0 AND note <= 100
    )
);

ALTER TABLE classe_etudiant
    ADD CONSTRAINT fk_classe_etudiant_classe
    FOREIGN KEY(id_classe)
    REFERENCE classe(id_classe);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE classe_etudiant
    ADD CONSTRAINT fk_classe_etudiant_etudiant
    FOREIGN KEY(no_etudiant)
    REFERENCE etudiant(no_etudiant);
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

-- Ajouter index
CREATE INDEX idx_nom_cours ON cours(nom);
CREATE INDEX idx_nom_etudiant ON etudiant(prenom, nom)
