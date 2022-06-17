//
//  CompteBic.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import Foundation

class CompteBic: Identifiable{
    
    private var coordsBic:UUID;
    private var solde:Int;
    
    init(coordsBic:UUID, solde:Int){
        self.coordsBic = coordsBic;
        self.solde = solde;
    }
    
    func getCoordsBic()->UUID{
        return self.coordsBic;
    }
    func getSolde()->Int{
        return self.solde;
    }
}
