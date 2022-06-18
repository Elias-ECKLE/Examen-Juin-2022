//
//  Nft.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import Foundation


class Nft: Identifiable{
    
    private var nom:String = "";
    private var source:String = "";

    private var prixDepart:Int = -1;
    
    private var description:String = "";
    private var proprietaire:String = "";
    private var majPrix:Int = -1;
    
    private var idAuteur:Int = 0;
    private var auteur = Auteur();

    /*
    init(nom:String, source:String, idAuteur:Int, prixDepart:Int, description:String){
        self.nom = nom;
        self.source = source;
        self.idAuteur = idAuteur;
        self.prixDepart = prixDepart;
        self.description = description;
    }*/
    
    //getters
    func GetNom()->String{
        return self.nom;
    }
    func GetSource()->String{
        return self.source;
    }
    func GetIdAuteur()->Int{
        return self.idAuteur;
    }
    func GetPrixDepart()->Int{
        return self.prixDepart
    }
    func GetDescription()->String{
        return self.description;
    }
    func GetProprio()->String{
        return self.proprietaire;
    }
    func GetMajPrix()->Int{
        return self.majPrix;
    }
    func GetAuteur()->Auteur{
        return self.auteur;
    }
    
    
    //mutateurs
    func SetNom(nom:String){
        self.nom = nom;
    }
    func SetSource(source:String){
        self.source = source;
    }
    func SetIdAuteur(idAuteur:Int){
        self.idAuteur = idAuteur;
    }
    func SetPrixDepart(prixDepart:Int){
        self.prixDepart = prixDepart;
    }
    func SetDescription(description:String){
        self.description = description;
    }
    func SetProprio(proprio:String){
        self.proprietaire = proprio;
    }
    func SetMajPrix(majPrix:Int){
        self.majPrix = majPrix;
    }
    func SetAuteur(auteur:Auteur){
        self.auteur = auteur;
    }
    
    
}
