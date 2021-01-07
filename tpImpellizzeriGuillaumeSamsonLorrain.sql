-- Création de la base de données --
CREATE DATABASE tpImpellizzeriGuillaumeSamsonLorrain;

-- Création des tables --
CREATE TABLE Utilisateur (
	idUtilisateur int(11) NOT NULL AUTO_INCREMENT,
	pseudo varchar(70) NOT NULL UNIQUE,
	motDePasse varchar(255) NOT NULL,
	PRIMARY KEY (idUtilisateur)
);

CREATE TABLE Lieu (
	idLieu int(11) NOT NULL AUTO_INCREMENT,
	noteLieu float(10) NOT NULL,
	nomLieu varchar(255) NULL,
	oldSite int(5) NULL,
	locationSite varchar(255) NULL,
	typeTouriste ENUM ('salle de spectacle','lieu sportif','site historique','musée','cinéma') NULL,
	adresseHotel varchar(255) NULL,
	nbEtoilesH int(5) NULL,
	nbChambres int(5) NULL,
	coosH int(10) NULL,
	typeLieu ENUM ('H','ST') NOT NULL,
	PRIMARY KEY (idLieu)
);

CREATE TABLE Restaurant (
	idRestaurant int(11) NOT NULL AUTO_INCREMENT,
	nomResto varchar(70) NOT NULL,
	telResto varchar(255) NOT NULL,
	typeCuisine ENUM ('traditionnel','fast food','italien','pizzeria','glacier') NOT NULL,
	catPrix ENUM (1,2,3) NOT NULL,
	noteResto float(10) NULL,
	PRIMARY KEY (idRestaurant)
);

CREATE TABLE Activite (
	idActivite int(11) NOT NULL AUTO_INCREMENT,
	nomActivite ENUM ('atelier','visite','visite guidée','concert') NOT NULL,
	noteActivite float(10) NULL,
	PRIMARY KEY (idActivite)
);

CREATE TABLE Transport (
	numLigne int(11) NOT NULL,
	heureDepart TIME NOT NULL,
	PRIMARY KEY (numLigne, heureDepart)
);

CREATE TABLE seTrouveDans (
	idLieu int(11) NOT NULL,
	idRestaurant int(11) NOT NULL,
	PRIMARY KEY (idLieu, idRestaurant),
	FOREIGN KEY (idLieu) REFERENCES Lieu(idLieu),
	FOREIGN KEY (idRestaurant) REFERENCES Restaurant(idRestaurant)
);

CREATE TABLE aLieuDans (
	idLieu int(11) NOT NULL,
	idActivite int(11) NOT NULL,
	PRIMARY KEY (idLieu, idActivite),
	FOREIGN KEY (idLieu) REFERENCES Lieu(idLieu),
	FOREIGN KEY (idActivite) REFERENCES Activite(idActivite)
);

CREATE TABLE estDesserviPar (
	idLieu int(11) NOT NULL,
	numLigne int(11) NOT NULL,
	heureDepart TIME NOT NULL,
	PRIMARY KEY (idLieu, numLigne, heureDepart),
	FOREIGN KEY (idLieu) REFERENCES Lieu(idLieu),
	FOREIGN KEY (numLigne) REFERENCES Transport(numLigne),
	FOREIGN KEY (heureDepart) REFERENCES Transport(heureDepart)
);

CREATE TABLE aNoteLieu (
	idAvisLieu int(11) NOT NULL,
	idLieu int(11) NOT NULL,
	idUtilisateur int(11) NOT NULL,
	titreAvis varchar(50) NOT NULL,
	noteUtilisateur ENUM (0,1,2,3,4,5) NOT NULL,
	commentaire varchar(255) NULL,
	PRIMARY KEY (idAvisLieu),
	FOREIGN KEY (idLieu) REFERENCES Lieu(idLieu),
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE aNoteResto (
	idAvisResto int(11) NOT NULL,
	idRestaurant int(11) NOT NULL,
	idUtilisateur int(11) NOT NULL,
	titreAvis varchar(50) NOT NULL,
	noteUtilisateur ENUM (0,1,2,3,4,5) NOT NULL,
	commentaire varchar(255) NULL,
	PRIMARY KEY (idAvisResto),
	FOREIGN KEY (idRestaurant) REFERENCES Restaurant(idRestaurant),
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE aNoteActivite (
	idAvisActivite int(11) NOT NULL,
	idActivite int(11) NOT NULL,
	idUtilisateur int(11) NOT NULL,
	titreAvis varchar(50) NOT NULL,
	noteUtilisateur ENUM (0,1,2,3,4,5) NOT NULL,
	commentaire varchar(255) NULL,
	PRIMARY KEY (idAvisActivite),
	FOREIGN KEY (idActivite) REFERENCES Activite(idActivite),
	FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);


-- Insertion des valeurs dans les tables --
INSERT INTO Utilisateur (idUtilisateur, pseudo, motDePasse) VALUES
(1, "Gui54", "guitare78"),
(2, "Lo54", "muscu87"),
(3, "ErnestoD", "mathis98"),
(4, "JosefY", "github"),
(5, "Kledd", "breton"),
(6, "FranH", "tr0un0ir"),
(7, "CloeP", "chapeaubeige"),
(8, "polk", "parachute"),
(9, "lelan", "vesteaYannLelan"),
(10, "Miguel", "Maintenun"),
(11, "Yoda", "BienSPasser");

INSERT INTO Lieu (idLieu, noteLieu, nomLieu, oldSite, locationSite, typeTouriste, adresseHotel, nbEtoilesH, nbChambres, coosH, typeLieu) VALUES
(1, 3.0, "Trivago", NULL, "Thionville", NULL, "14 rue de la Cuisine", 1, 46, 0387659852, "H"),
(2, 0.4, "PireHotel", NULL, "Metz", NULL, "35 rue des Eboueurs", 1, 3, 0383789023, "H"),
(3, 4.6, "Mémorial de Verdun", 54, "Verdun", "site historique", NULL, NULL, NULL, NULL, "ST"),
(4, 4.1, "Place Stanislas", 266, "Nancy", "site historique", NULL, NULL, NULL, NULL, "ST"),
(5, 4.3, "Mercure gare", NULL, "Nancy", NULL, "34 rue de la Gare", 4, 200, 0383671234, "H"),
(6, 1.7, "Ibis hôtel", NULL, "Metz", NULL, "21 avenue Belle Isles", 3, 100, 0387041208, "H"),
(7, 4.1, "Cathédrale de Metz", 471, "Metz", "site historique", NULL, NULL, NULL, NULL, "ST"),
(8, 4.1, "Salle Poirel", 50, "Nancy", "salle de spectacle", NULL, NULL, NULL, NULL, "ST"),
(9, 4.1, "Kinépolis", 41, "Nancy", "cinéma", NULL, NULL, NULL, NULL, "ST"),
(10, 4.1, "Musée des beaux arts", 150, "Nancy", "musée", NULL, NULL, NULL, NULL, "ST"),
(11, 4.1, "Château de Lunéville", 320, "Lunéville", "site historique", NULL, NULL, NULL, NULL, "ST");

INSERT INTO Restaurant (idRestaurant, nomResto, telResto, typeCuisine, catPrix, noteResto) VALUES
(1, "delArte", 0383471295, "italien", 1, 3.2),
(2, "Pizza Kebab", 0358746525, "pizzeria", 1, 2.5),
(3, "Il ristorante", 0383412659, "italien", 2, 4.2),
(4, "Excelsior", 0383694712, "traditionnel", 3, 4.8),
(5, "La Table de Gui", 0383425187, "traditionnel", 3, 4.3),
(6, "Glaces & Cie", 0383652001, "glacier", 1, 4.0),
(7, "La Kouizine de Miguel", 0383689541, "fast food", 1, 2.3),
(8, "Mangez M’hallin!", 0383100549, "fast food", 2, 4.6),
(9, "Dominos", 0383985320, "pizzeria", 1, 3.4),
(10, "L’Auberg’Inn", 0383541676, "traditionnel", 2, 4.1);

INSERT INTO Activite (idActivite, nomActivite, noteActivite) VALUES
(1, "visite guidée", 4.3),
(2, "visite", 3.5),
(3, "concert", 3.2),
(4, "atelier", 4.1),
(5, "visite", 4.9),
(6, "visite guidée", 3.6),
(7, "concert", 1.9),
(8, "visite", 2.9),
(9, "atelier", 3.3),
(10, "visite", 4.2);

INSERT INTO Transport (numLigne, heureDepart) VALUES
(1, 10:50:00),
(1, 15:35:20),
(2, 16:45:00),
(2, 18:30:00),
(5, 08:15:00),
(5, 09:30:50),
(5, 12:30:00),
(5, 17:30:00),
(6, 10:01:20),
(6, 12:41:00);

INSERT INTO seTrouveDans (idLieu, idRestaurant) VALUES
(1, 2),
(2, 7),
(4, 9),
(4, 6),
(4, 5),
(5, 4),
(6, 8),
(7, 1),
(9, 3),
(11, 10);

INSERT INTO estDesserviPar (idLieu, numLigne, heureDepart) VALUES 
(1, 1, 10:50:00),
(7, 1, 15:35:20),
(4, 5, 08:15:00),
(5, 5, 09:30:50),
(8, 5, 12:30:00),
(9, 5, 17:30:00),
(10, 2, 16:45:00),
(11, 2, 18:30:00),
(2, 6, 10:01:20),
(7, 6, 12:41:00);

INSERT INTO aLieuDans (idLieu, idRestaurant) VALUES
(3, 1),
(3, 2),
(4, 5),
(8, 3),
(8, 7),
(10, 4),
(10, 9),
(10, 8),
(11, 6),
(11, 10);

INSERT INTO aNoteLieu (idAvisLieu, idLieu, idUtilisateur, titreAvis, noteUtilisateur, commentaire) VALUES
(1, 1, 2, "Moyen", 3, NULL),
(2, 2, 3, "Le pire", 0, "L'hôtel porte bien son nom..."),
(3, 4, 5, "Pas mal !", 4, NULL),
(4, 6, 10, "Sympa", 3, NULL),
(5, 2, 11, "UNE HONTE", 1, "Tu crois que c'est du respect ça mon garçon !"),
(6, 7, 7, "Juste majestueux", 5, "Les vitraux des Chagall sont incroyables"),
(7, 8, 9, "incroyable", 5, NULL),
(8, 9, 4, "C OUF", 5, "Le filme été just geainial un truck deux fous"),
(9, 10, 6, "Je n'entre pas dans les détails", 4, NULL)
(10, 11, 1, 'Pas ouf', 3, "Je m'attendais à mieux");

INSERT INTO aNoteResto (idAvisResto, idRestaurant, idUtilisateur, titreAvis, noteUtilisateur, commentaire) VALUES
(1, 1, 2, "Bonnes pizza", 3, NULL),
(2, 2, 3, "Le meilleur grec de Nancy et de très loin", 5, NULL),
(3, 4, 5, "Très professionnel", 4, "Les serveurs ont été aimables"),
(4, 6, 10, "Sympa", 3, NULL),
(5, 5, 11, "Très bonne adresse", 5, "Gui le chef nous a fait un tartare des plus savoureux que j’ai goûté dans mon existence"),
(6, 7, 7, "De l’abus en boîte", 0, "Impossible de comprendre le menu… Je déconseille !"),
(7, 8, 9, "Parfait", 5, "J'aime bien le patron..."),
(8, 10, 4, "C CHER", 4, "G bi1 manger mé ct lé pris son vrémant beaucou cher"),
(9, 10, 6, "Ont le sens du détail", 4, NULL)
(10, 9, 1, 'Pas ouf', 3, "Je m'attendais à mieux");

INSERT INTO aNoteActivite (idAvisActivite, idActivite, idUtilisateur, titreAvis, noteUtilisateur, commentaire) VALUES
(1, 1, 2, "Très bonne visite", 5, NULL),
(2, 2, 3, "Pas mal", 3, NULL),
(3, 4, 5, "Atelier divertissant", 4, "J'ai appris pleins de choses"),
(4, 6, 10, "Guide ennuyant", 3, NULL),
(5, 5, 11, "Excellent !", 5, "C'était génial !"),
(6, 7, 7, "Pire concert", 0, "J'ai perdu un tympan..."),
(7, 8, 9, "Mouais...", 3, NULL),
(8, 10, 4, "ct bi1", 5, "Kool !!!"),
(9, 10, 6, "Très détaillée", 4, NULL),
(10, 3, 1, 'GROS SON', 4, NULL);

-- Création d'index --


-- Création utilisateurs --
CREATE USER 'internauteImpellizzeriGuillaumeSamsonLorrain'@'localhost' IDENTIFIED BY 'passInternaute';
CREATE USER 'gestionnaireImpellizzeriGuillaumeSamsonLorrain'@'localhost' IDENTIFIED BY 'passGestionnaire';
CREATE USER 'administrateurImpellizzeriGuillaumeSamsonLorrain'@'localhost' IDENTIFIED BY 'passAdministrateur';
CREATE USER 'utilisateurImpellizzeriGuillaumeSamsonLorrain'@'localhost' IDENTIFIED BY 'passUtilisateur';

-- Permissions aux utilisateurs --

	-- Internaute (accès en lecture) --
	GRANT SELECT
		ON tpImpellizzeriGuillaumeSamsonLorrain.*
		TO 'internauteImpellizzeriGuillaumeSamsonLorrain'@'localhost';

	-- Gestionnaire (droits CRUD)
	GRANT SELECT, UPDATE, INSERT, DELETE
		ON tpImpellizzeriGuillaumeSamsonLorrain.*
		TO 'gestionnaireImpellizzeriGuillaumeSamsonLorrain'@'localhost';

	-- Administrateur (accès à toute la base) --
	GRANT ALL
		ON tpImpellizzeriGuillaumeSamsonLorrain.*
		TO 'administrateurImpellizzeriGuillaumeSamsonLorrain'@'localhost';

	-- Utilisateur (peut donner un avis)
		GRANT SELECT, INSERT /* Pas sûr encore */
		ON tpImpellizzeriGuillaumeSamsonLorrain.*
		TO 'utilisateurImpellizzeriGuillaumeSamsonLorrain'@'localhost';

-- Création Vue sur les avis des Utilisateurs --


-- Création Trigger qui vérifie ... --


-- Création Procédure stockée "topten" --

