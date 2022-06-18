//
//  Auteur.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 18/06/2022.
//

import Foundation

class Auteur{
    

    
    private var nom:String = "";
    private var prenom:String = "";



    func GetNom()->String{
        return self.nom;
    }
    func GetPrenom()->String{
        return self.prenom;
    }


    func SetNom(nom:String){
        self.nom = nom;
    }
    func SetPrenom(prenom:String){
        self.prenom = prenom;
    }

    
}
