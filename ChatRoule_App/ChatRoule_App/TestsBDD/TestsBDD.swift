//
//  ContentView.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct TestsBDD: View {
    
    @State var valeurId = "";
    @State var bddDeTest = Tests_BDDHelper()
    @State var idUtilisateurs = [Int]()
    
    var body: some View {
        
        VStack{
            Text("Test BDD avec sqlite3")
                .padding();
            
            Button("Click pour créer la table"){
                bddDeTest.CreerTable();
            }
            Form{
                TextField("Entrez nombre", text:$valeurId)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
            }
            Button("Click pour insérer dans la table"){
  
                if(self.valeurId != ""){
                    bddDeTest.InsererDonnees(nomTable: "utilisateur", valeurId: Int(self.valeurId)!)
                }
                else{
                    print("Pas de data entrée ")
                }
               
                
            }
               
            Button("Click pour récupérer dans la table"){
                idUtilisateurs=bddDeTest.LireDonnees()
              
            }
            ForEach(0..<idUtilisateurs.count, id: \.self){i in
                let integer = String(idUtilisateurs[i])
                Text("\(integer)")
            }
            Button("Click pour vider la table"){
                bddDeTest.SupprimerDonnees();
            }
            

        }

    }
}

struct TestsBDD_Previews: PreviewProvider {
    static var previews: some View {
        TestsBDD()
    }
}
