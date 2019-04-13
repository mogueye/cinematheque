-- Création de la base de données: `tpDB`
DROP DATABASE IF EXISTS `cinematheque`;
CREATE DATABASE `cinematheque`;

-- Notification au SGBD qu'on utilise cette base de données pour les requêtes qui vont suivre
USE `cinematheque`;

CREATE TABLE cinema (
	idCinema smallint unsigned,
	nom varchar(50) not null,
	adresse varchar(100) not null,
	telephone varchar(20),
	constraint pk_cinema primary key (idCinema)
);

CREATE TABLE salle (
	idSalle smallint unsigned,
	numero tinyint unsigned not null,
	nbPlaces tinyint unsigned,
	idCinema smallint unsigned not null,
	constraint pk_salle primary key (idSalle),
	constraint fk_cinema foreign key (idCinema) references cinema (idCinema)
);

CREATE TABLE personne (
	idPers int unsigned,
	nom varchar(50) not null,
	prenom varchar(50),
	nationalite varchar(30),
	dnaiss date,
	lnaiss varchar(50),
	constraint pk_personne primary key (idPers)
);

CREATE TABLE acteur (
	idPers int unsigned,
	constraint pk_acteur primary key (idPers),
	constraint fk_personne_1 foreign key (idPers) references personne (idPers)
);


CREATE TABLE realisateur (
	idPers int unsigned,
	constraint pk_realisateur primary key (idPers),
	constraint fk_personne_2 foreign key (idPers) references personne (idPers)
);

CREATE TABLE film (
	idFilm int unsigned,
	titre varchar(100) not null,
	annee year,
	constraint pk_film primary key (idFilm)
);

CREATE TABLE jouer (
	idPers int unsigned,
	idFilm int unsigned,
	constraint pk_jouer primary key (idPers, idFilm),
	constraint fk_acteur foreign key (idPers) references acteur (idPers),
	constraint fk_film_1 foreign key (idFilm) references film (idFilm)
);

CREATE TABLE realiser (
	idPers int unsigned,
	idFilm int unsigned,
	constraint pk_realiser primary key (idPers, idFilm),
	constraint fk_realisateur foreign key (idPers) references realisateur (idPers),
	constraint fk_film_2 foreign key (idFilm) references film (idFilm)
);

CREATE TABLE projection (
	jour date,
	heure time,
	idSalle smallint unsigned,
	idFilm int unsigned not null,
	constraint pk_projection primary key (jour, heure, idSalle),
	constraint fk_salle foreign key (idSalle) references salle (idSalle),
	constraint fk_film_3 foreign key (idFilm) references film (idFilm)
);