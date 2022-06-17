//
//  BDD_Helper.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 16/06/2022.
//

import Foundation
import SQLite3


//-----------------------------------------CREATION TABLES-----------------------------------------------------

class BDD_Helper{
    
    var bdd: OpaquePointer!
    var path : String  = "BDD.sqlite"
    
    init(){
        self.bdd = CreerBdd();


    }
    
    
    //-------------------------------------CREATION BDD ET TABLES SI N'EXISTE PAS-------------------------------------------------
    func CreerBdd() -> OpaquePointer!{
        
        let filePath  = try! FileManager.default.url(
            for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
        
        var bdd: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &bdd) != SQLITE_OK{
            print("Base de données erreur ")
            return nil;
        }
        else{
            print("Base de données crée avec le chemin \(path)")
            return bdd
        }
    }
    
    func CreerTableUtilisateur(){
        let query = " CREATE TABLE IF NOT EXISTS utilisateurs(email varchar(255) PRIMARY KEY NOT NULL, motDePasse varchar(50) NOT NULL, nom varchar(50) NOT NULL, prenom varchar(50) NOT NULL, age int NOT NULL )"
          var statement:OpaquePointer? = nil
          
          if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
             
              if sqlite3_step(statement) == SQLITE_DONE{
                  print("création table utilisateurs OK")
              }
              else{
                  print("création table utilisateurs NOT OK")
              }
          }
          else{
              print("préparation table utilisateur échouée")
          }
    }
    
    
    func CreerTableAuteurs(){
        let query = "CREATE TABLE IF NOT EXISTS auteurs( id int PRIMARY KEY NOT NULL, nom varchar(255) NOT NULL, prenom varchar(255) NOT NULL)"
          var statement:OpaquePointer? = nil
          
          if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
             
              if sqlite3_step(statement) == SQLITE_DONE{
                  print("création table auteurs OK")
              }
              else{
                  print("création table auteurs NOT OK")
              }
          }
          else{
              print("préparation table auteurs échouée")
          }
    }
    
    
    func CreerTableComptebic(){
        let query = "CREATE TABLE IF NOT EXISTS comptebic ( id varchar(27) PRIMARY KEY NOT NULL, emailPropietaire varchar(255)  NOT NULL, solde int NOT NULL, FOREIGN KEY (emailPropietaire) REFERENCES utilisateurs(email))"
          var statement:OpaquePointer? = nil
          
          if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
             
              if sqlite3_step(statement) == SQLITE_DONE{
                  print("création table compteBic OK")
              }
              else{
                  print("création table compteBic NOT OK")
              }
          }
          else{
              print("préparation table compteBic échouée")
          }
        
    }
    
    func CreerTableNFT(){
        
        let query = "CREATE TABLE IF NOT EXISTS nft( nom varchar(255) PRIMARY KEY NOT NULL, source varchar(255) NOT NULL, prixDepart int NOT NULL,majPrix int, emailPropietaire varchar(255), idAuteur int NOT NULL,description varchar(1000) NOT NULL, FOREIGN KEY (emailPropietaire) REFERENCES utilisateurs(email), FOREIGN KEY (idAuteur) REFERENCES auteurs(id))"
        
        var statement:OpaquePointer? = nil
          
          if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
             
              if sqlite3_step(statement) == SQLITE_DONE{
                  print("création table nft OK")
              }
              else{
                  print("création table nft NOT OK")
              }
          }
          else{
              print("préparation table nft échouée")
          }
    }
    
    
    
    //-------------------------------------------INSERTIONS DE DONNEES PAR DEFAUTS-----------------------------------------------
    
    func InsertDefaultUtilisateur(){
        let query = " INSERT INTO utilisateurs (email, motDePasse, nom, prenom, age) VALUES ('e.eckle@ludus-academie.com', 'Ecklee01' ,'eckle','elias',20),('examscycle2@ludus-academie.com','ExamsCycle2','dupont','yann',42)";
        
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1,1)
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Insertion valeurs utilisateurs par défaut terminée")
            }
            else{
                print("Insertion valeurs utilisateurs par défaut déjà insérée")
            }
        }
        else{
            print("L'envoie des valeurs utilisateurs par défaut a échouée")
        }
    }
    
    func InsertDefaultAuteurs(){
        let query = " INSERT INTO auteurs (id, nom, prenom) VALUES (1, 'al-mamun', 'talukder'),(2, 'thrive','io'), (3, 'denys', 'zavalii'),(4, 'js', 'racoon'),(5, 'issey', 'issey'),(6, 'naomi', 'beekhuizen'),(7, 'ridwan', 'ridun'),(8, 'black', 'cat')";
        
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1,1)
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Insertion valeurs auteurs par défaut terminée")
            }
            else{
                print("Insertion valeurs auteurs par défaut déjà insérée")
            }
        }
        else{
            print("L'envoie des valeurs auteurs par défaut a échouée")
        }
    }
    
    func InsertDefaultComptesBic(){
        let query = " INSERT INTO comptebic (id, emailPropietaire, solde) VALUES ('fr23456378315789', 'e.eckle@ludus-academie.com', 737), ('gs12094835819384','examscycle2@ludus-academie.com',2456)";
        
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1,1)
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Insertion valeurs comptebic par défaut terminée")
            }
            else{
                print("Insertion valeurs comptebic par défaut déjà insérée")
            }
        }
        else{
            print("L'envoie des valeurs comptebic par défaut a échouée")
        }
    }
    
    
    func InsertDefaultNft(){
        let query = "INSERT INTO nft (nom,source, prixDepart, majPrix, description, emailPropietaire, idAuteur) VALUES ('sweety', 'catnft-1' ,'20',NULL,'Sweety est un gentil chat plein de surprise, il aime jouer et permet de revenir en enfance de la plus belle des façons. Il veut tout simplement passer un très bon moment et vivre selon la philosophie du Carpe Diem. ',NULL,1), ('tabasco', 'catnft-2' ,'200',NULL,'Tabasco  pour étémologie ,tabac, désigne un chat mesquin et craintif. Tabasco aime faire peur et ne sert que ses propres intérêts. ','e.eckle@ludus-academie.com',2), ('tango', 'catnft-3' ,'30',NULL,'Agile depuis toujours, Tango est prêt à tout pour danser et alterner pattes, queue  et prestations orales. Il est le meneur du dancefloor ','e.eckle@ludus-academie.com',3), ('senic', 'catnft-4' ,'500',NULL,'Un adorable chaton en pleine croissance. Il a besoin des humains pour évoluer et se sentir aimé ! Contemplez cet animal si choux','e.eckle@ludus-academie.com',4), ('ricky', 'catnft-5' ,'2000',NULL,'Ricky a des airs de pharaon car il vient directement d Egypte. Voulant toujours donner des ordres et faire preuve d autorité, on peut se demander si ce n est pas un décédent de la lignée même des pharaons ? ' ,NULL,5), ('peeenuts', 'catnft-6' ,'60',NULL,'Peeenuts pour trois chats inséparables. Ils se collent tout le le temps ensemble et sont redoutables dès que on ose franchir leur territoire','examscycle2@ludus-academie.com',6), ('saphir', 'catnft-7' ,'60',NULL,'Saphir est toujours très discret et dort très souvent. On ne sait donc pas grand chose de lui hormis le fait que chaque déplacement, son pelage aux couleurs de métaux précieux ne laisse pas indifférent',NULL,7), ('sky', 'catnft-8' ,'112',NULL,'Sky, un chat tout à fait ordinaire comme on en voit beaucoup','examscycle2@ludus-academie.com',8)";
        
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1,1)
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Insertion valeurs nft par défaut terminée")
            }
            else{
                print("Insertion valeurs nft par défaut déjà insérée")
            }
        }
        else{
            print("L'envoie des valeurs nft par défaut a échouée")
        }
    }
    
    
    
    //-----------------------------------------------INTERROGATIONS BASES----------------------------
    
    func utilisateurExiste(email:String, motDePasse:String)->Utilisateur{
        
        let utilisateurInst = Utilisateur();

        let query = "SELECT * FROM utilisateurs WHERE email = TRIM('\(email)') AND motDePasse = TRIM('\(motDePasse)')";
        var statement:OpaquePointer? = nil
        
       
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                //let test =String(describing :sqlite3_column_text(statement, 0));
                
       
                
                utilisateurInst.SetEmail(email: String(cString: sqlite3_column_text(statement, 0)));
                utilisateurInst.SetMotDePasse(motDePasse: String(cString: sqlite3_column_text(statement, 1)) );
                utilisateurInst.SetNom(nom: String(cString: sqlite3_column_text(statement, 2)));
                utilisateurInst.SetPrenom(prenom: String(cString: sqlite3_column_text(statement, 3)));
                utilisateurInst.SetAge(age: Int(sqlite3_column_int(statement, 4)));
               
               
                print("Email :  \(utilisateurInst.GetEmail())");
                print("Mot de passe : " + utilisateurInst.GetMotDePasse());
                print("Nom : " + utilisateurInst.GetNom());
                print("Prenom : " + utilisateurInst.GetPrenom());
                print("Age : " + String(utilisateurInst.GetAge()));
    
                utilisateurInst.SetAuthentificationEtat(authentificationEtat: true);
                
                
                
              
            }
        }
        else{
            print("Utilisateur introuvable dans la base");
            utilisateurInst.SetAuthentificationEtat(authentificationEtat: false);
        
        }
        
        return utilisateurInst;
    }
    
    
    func NFTUtilisateur(utilisateur:Utilisateur)->[Nft]{
        
        var nftArray = [Nft]();

        let query = "SELECT * FROM nft WHERE emailPropietaire = TRIM('\(utilisateur.GetEmail())')";
        var statement:OpaquePointer? = nil
        
       
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                let nftInst = Nft();
                
                nftInst.SetNom(nom: String(cString: sqlite3_column_text(statement, 0)));
                nftInst.SetSource(source: String(cString: sqlite3_column_text(statement, 1)))
                nftInst.SetPrixDepart(prixDepart: Int(sqlite3_column_int(statement, 2)))
                nftInst.SetMajPrix(majPrix: Int(sqlite3_column_int(statement, 3)))
                nftInst.SetProprio(proprio: String(cString: sqlite3_column_text(statement, 4)))
                nftInst.SetIdAuteur(idAuteur: Int(sqlite3_column_int(statement, 5)))
                nftInst.SetDescription(description: String(cString: sqlite3_column_text(statement, 6)))
               
                print("Nom : " + nftInst.GetNom());
                print("Source : " + nftInst.GetSource());
                print("Prix de départ : " + String(nftInst.GetPrixDepart()));
                print("MajPrix : " + String(nftInst.GetMajPrix()));
                print("Proprio : " + nftInst.GetProprio());
                print("IdAuteur : " + String(nftInst.GetIdAuteur()));
                print("Description : " + nftInst.GetDescription());
    
                nftArray.append(nftInst);
            }
        }
        else{
            print("Pas de nft pour cet utilisateur dans la base");
        }
        
        return nftArray;
    }
    
    
    
    
    func NFTSurMarche()->[Nft]{
        
        var nftArray = [Nft]();

        let query = "SELECT * FROM nft WHERE emailPropietaire is null";
        var statement:OpaquePointer? = nil
        
       
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                let nftInst = Nft();
                
                nftInst.SetNom(nom: String(cString: sqlite3_column_text(statement, 0)));
                nftInst.SetSource(source: String(cString: sqlite3_column_text(statement, 1)))
                nftInst.SetPrixDepart(prixDepart: Int(sqlite3_column_int(statement, 2)))
                nftInst.SetMajPrix(majPrix: Int(sqlite3_column_int(statement, 3)))
                nftInst.SetIdAuteur(idAuteur: Int(sqlite3_column_int(statement, 5)))
                nftInst.SetDescription(description: String(cString: sqlite3_column_text(statement, 6)))
               
                print("Nom : " + nftInst.GetNom());
                print("Source : " + nftInst.GetSource());
                print("Prix de départ : " + String(nftInst.GetPrixDepart()));
                print("MajPrix : " + String(nftInst.GetMajPrix()));
                print("Proprio : " + nftInst.GetProprio());
                print("IdAuteur : " + String(nftInst.GetIdAuteur()));
                print("Description : " + nftInst.GetDescription());
    
                nftArray.append(nftInst);
            }
        }
        else{
            print("Tous les nft ont été achetés");
        }
        
        return nftArray;
    }
    
    
    
    
    
    
    
    
}

 

