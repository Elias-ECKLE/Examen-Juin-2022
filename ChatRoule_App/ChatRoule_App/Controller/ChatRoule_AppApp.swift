//
//  ChatRoule_AppApp.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

@main
struct ChatRoule_AppApp: App {
    
    @State var BDD = BDD_Helper();
    @State var utilisateurActuel = Utilisateur();
    

    
    var body: some Scene {
        WindowGroup {
            
            //si l'utilisateur s'est déjà authentifié alors il rentre directement dans l'application sans se connecter
        switch utilisateurActuel.GetAuthentificationEtat() { //stockage de cet élément dans le coredata
        case false:
            FormConnexion(BDD:$BDD, utilisateurActuel: $utilisateurActuel)
                .onAppear{
                    BDD.CreerTableUtilisateur();
                    BDD.CreerTableAuteurs();
                    BDD.CreerTableComptebic();
                    BDD.CreerTableNFT();
                    
                    BDD.InsertDefaultUtilisateur();
                    BDD.InsertDefaultAuteurs();
                    BDD.InsertDefaultComptesBic();
                    BDD.InsertDefaultNft();
                }
        case true:
            ContentView(BDD:$BDD, utilisateurActuel: $utilisateurActuel)

        }

                
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
