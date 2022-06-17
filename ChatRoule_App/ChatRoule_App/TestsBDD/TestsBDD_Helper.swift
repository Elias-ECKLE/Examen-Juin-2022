//
//  BDDHelper.swift
//  ChatRoule
//
//  Created by Elias ECKLE on 15/06/2022.
//

import Foundation
import SQLite3

class Tests_BDDHelper{
    
    var bdd: OpaquePointer!
    var path : String  = "BDD.sqlite"
    
    init(){
        self.bdd = CreerBdd();

    }
    
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
        
    func CreerTable(){
      let query = "CREATE TABLE IF NOT EXISTS utilisateur(id INTEGER PRIMARY KEY NOT NULL);"
        var statement:OpaquePointer? = nil
        
        //sqlite3_exec(self.bdd, query, nil, nil, nil)
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
           
            if sqlite3_step(statement) == SQLITE_DONE{
                print("création table ok")
            }
            else{
                print("création table non ok")
            }
        }
        else{
            print("préparation table échouée")
        }
    }
    
    
    
    func InsererDonnees(nomTable:String, valeurId:Int){
        let query = "INSERT INTO \(nomTable) (id) VALUES (\(valeurId))"
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_int(statement, 1,1)
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Insertion terminée")
            }
            else{
                print("Insertion déjà insérée")
            }
        }
        else{
            print("L'envoie des valeurs a échouée")
        }
            
    }
    
    func LireDonnees()->[Int]{
        
        let query = "SELECT * FROM utilisateur ORDER BY id ASC"
        var statement:OpaquePointer? = nil
        
        var arrayUser = [Int]()

        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            
            while sqlite3_step(statement) == SQLITE_ROW{
                
                let id = Int(sqlite3_column_int(statement, 0))
                arrayUser.append(id);
                print(id)
            }
        }
        
        return arrayUser
        
    }
    
    
    func SupprimerDonnees(){
        let query = "DELETE FROM utilisateur"
        var statement:OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.bdd, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE{
                print("Table utilisateur vidée")
            }
            else{
                print("Table utilisateur pas vidée")
            }
        }
        else{
            print("Problème requête vidage Table utilisateur")
        }
    }
    
    
    
}
