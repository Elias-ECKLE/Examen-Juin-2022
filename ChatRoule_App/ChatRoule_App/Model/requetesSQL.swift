//
//  requetesSQL.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 17/06/2022.
//

/*
 
 
 
 //créer table utilisateurs
 CREATE TABLE IF NOT EXISTS utilisateurs(
 email varchar(255) PRIMARY KEY COLLATE latin1_general_cs NOT NULL,
 motDePasse varchar(50) COLLATE latin1_general_cs NOT NULL,
 nom varchar(50) COLLATE latin1_general_cs NOT NULL,
 prenom varchar(50) COLLATE latin1_general_cs NOT NULL,
 age int NOT NULL )
 
 /*
  CREATE TABLE IF NOT EXISTS auteurs(
  id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom varchar(255) COLLATE latin1_general_cs NOT NULL,
  prenom varchar(255) COLLATE latin1_general_cs NOT NULL )
  */
 
 
 CREATE TABLE IF NOT EXISTS nft(
  nom varchar(255) PRIMARY KEY COLLATE latin1_general_cs NOT NULL,
  source varchar(255) COLLATE latin1_general_cs NOT NULL,
  prixDepart int NOT NULL,majPrix int,
  emailPropietaire varchar(255) COLLATE latin1_general_cs,
  idAuteur int NOT NULL,
  description varchar(1000) COLLATE latin1_general_cs NOT NULL
     )
 */

/*
CREATE TABLE IF NOT EXISTS comptebic
( id varchar(27) PRIMARY KEY COLLATE latin1_general_cs NOT NULL,
  emailPropietaire varchar(255) COLLATE latin1_general_cs NOT NULL,
  solde int NOT NULL
)

ALTER TABLE comptebic ADD FOREIGN KEY (emailPropietaire) REFERENCES utilisateurs(email)

ALTER TABLE nft ADD FOREIGN KEY (emailPropietaire) REFERENCES utilisateurs(email)
ALTER TABLE nft ADD FOREIGN KEY (idAuteur) REFERENCES auteurs(id)

 */




 //-----------------------------------------INSETIONS TABLES-----------------------------------------------------
/*
 INSERT INTO utilisateurs (email, motDePasse, nom, prenom, age) VALUES
('e.eckle@ludus-academie.com', 'Ecklee01' ,'eckle','elias',20),
('examscycle2@ludus-academie.com','ExamsCycle2','dupont','yann',42)
*/

/*

 INSERT INTO auteurs (id, nom, prenom) VALUES
 (1, 'al-mamun', 'talukder'),
 (2, 'thrive','io'),
 (3, 'denys', 'zavalii'),
 (4, 'js', 'racoon'),
 (5, 'issey', 'issey'),
 (6, 'naomi', 'beekhuizen'),
 (7, 'ridwan', 'ridun'),
 (8, 'black', 'cat')
*/

/*

 INSERT INTO comptebic (id, emailPropietaire, solde) VALUES
 ('fr23456378315789', 'e.eckle@ludus-academie.com', 737),
 ('gs12094835819384','examscycle2@ludus-academie.com',2456)

*/

/*


 INSERT INTO nft (nom,source, prixDepart, majPrix, description, emailPropietaire, idAuteur) VALUES
 ('sweety', 'catnft-1' ,'20',NULL,'Sweety est un gentil chat plein de surprise, il aime jouer et permet de revenir en enfance de la plus belle des façons. Il veut tout simplement passer un très bon moment et vivre selon la philosophie du Carpe Diem. ',NULL,1),

 ('tabasco', 'catnft-2' ,'200',NULL,'Tabasco de l étémologie tabac désigne un chat mesquin et craintif. Tabasco n hésite pas à faire peur et ne sert que ses propres intérêts. ','e.eckle@ludus-academie.com',2),

 ('tango', 'catnft-3' ,'30',NULL,'Agile depuis toujours, Tango est prêt à tout pour danser et alterner pattes, queue  et prestations orales. Il est le meneur du danceflor ','e.eckle@ludus-academie.com',3),

 ('senic', 'catnft-4' ,'500',NULL,'Un adorable chaton en pleine croissance. Il a besoin des humains pour évoluer et se sentir aimé ! Contemplez cet animal si choux','e.eckle@ludus-academie.com',4),

 ('ricky', 'catnft-5' ,'2000',NULL,'Ricky a des airs de pharaon car il vient directement d Egypte. Voulant toujours donner des ordres et faire preuve d autorité, on peut se demander si ce n est pas un décédent de la lignée même des pharaons ? ' ,NULL,5),

 ('peeenuts', 'catnft-6' ,'60',NULL,'Peeenuts pour trois chats inséparables. Ils se collent tout le le temps ensemble et sont redoutables dès que l\'on franchi leur territoire','examscycle2@ludus-academie.com',6),

 ('saphir', 'catnft-7' ,'60',NULL,'Saphir est toujours très discret et dort très souvent. On ne sait donc pas grand chose de lui à part qu\à chaque déplacmeent son pelage aux couleurs de métaux précieux ne laisse pas indifférent',NULL,7),

 ('sky', 'catnft-8' ,'112',NULL,'Sky, un chat tout à fait ordinaire comme plein d\'autres','examscycle2@ludus-academie.com',8)




 */
 
 
 
 
 
 
 
 
 
 

