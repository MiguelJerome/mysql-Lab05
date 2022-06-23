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
    id_saison INT,
    saison VARCHAR(10),
);

-- Créer le cours
DROP TABLE IF EXISTS cours;
CREATE TABLE cours(
    id_cours CHAR(9),
    nom VARCHAR(50),
    description TEXT
);

-- Créer le cours programme
DROP TABLE IF EXISTS cours_programme;
CREATE TABLE cours_programme(
    code_cours CHAR(9),
    id_programme INT
);

-- Créer le semestre
DROP TABLE IF EXISTS semestre;
CREATE TABLE semestre(
    id_semestre INT,
    id_season INT,
    annee YEAR
);

-- Créer la classe
DROP TABLE IF EXISTS classe;
CREATE TABLE classe(
    id_classe INT,
    id_semestre INT,
    code_cours CHAR(9)
);

-- Créer l'etudiant
DROP TABLE IF EXISTS etudiant
CREATE TABLE etudiant(
    no_etudiant CHAR(7),
    prenom VARCHAR(50),
    nom VARCHAR(50),
    telephone CHAR(14),
    note_moyenne FLOAT
);




