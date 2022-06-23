    DROP DATABASE IF EXITST exemple;

CREATE DATABASE exemple
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
    
USE exemple;

DROP TABLE IF EXITS nom_table;

CREATE TABLE nom_table(
    colonne1 INT,
    colonne2 VARCHAR(200)
);

ALTER TABLE nom_table ADD colonne3 INT;
ALTER TABLE nom_table DROP colonne3;
ALTER TABLE nom_table MODIFY colonne3 VARCHAR(200);

