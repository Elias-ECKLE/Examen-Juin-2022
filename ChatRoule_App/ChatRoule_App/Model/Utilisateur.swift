//
//  Utilisateur.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import Foundation

class Utilisateur: Identifiable{
    
   private var email:String = "";
    private var motDePasse:String = "";
    
    private var nom:String = "";
    private var prenom:String = "";
    private var age:Int = -1;
    
    private var authentificationEtat = false;
    
    public var nftDeUtilisateur:[Nft] = [Nft()]
    public var nftA_Acheter:[Nft] = [Nft()]


   /* init(email:String, motDePasse:String, nom:String, prenom:String, age:Int){
        self.email = email;
        self.motDePasse = motDePasse;
        self.nom = nom;
        self.prenom = prenom;
        self.age = age;
    }*/
    
    //getters
    func GetEmail()->String{
        return self.email;
    }
    func GetMotDePasse()->String{
        return self.motDePasse;
    }
    func GetNom()->String{
        return self.nom;
    }
    func GetPrenom()->String{
        return self.prenom;
    }
    func GetAge()->Int{
        return self.age;
    }
    func GetAuthentificationEtat()->Bool{
        return self.authentificationEtat;
    }

    
    //mutateurs
    func SetEmail(email:String){
        self.email = email;
    }
    func SetMotDePasse(motDePasse:String){
        self.motDePasse = motDePasse;
    }
    func SetNom(nom:String){
        self.nom = nom;
    }
    func SetPrenom(prenom:String){
        self.prenom = prenom;
    }
    func SetAge(age:Int){
        self.age = age;
    }
    


    func SetAuthentificationEtat(authentificationEtat:Bool){
        self.authentificationEtat = authentificationEtat;
    }
}
