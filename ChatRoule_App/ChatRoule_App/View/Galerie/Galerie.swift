//
//  Galerie.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct Galerie: View {
    
    @Binding var BDD:BDD_Helper;
    @Binding var utilisateurActuel: Utilisateur;
    
    let title:String;
    let proxy:GeometryProxy;
    

    
    var body: some View {
        
        NavigationView{
            
            List(utilisateurActuel.nftDeUtilisateur){ chaton in
                
                NavigationLink(destination: pushGalerie(proxy: self.proxy, chaton: chaton)){
                    HStack{
                        Image(chaton.GetSource())
                            .resizable()
                            .frame(width: proxy.size.width*0.4, height:proxy.size.height*0.2)
                        Spacer()
                        Text(chaton.GetNom().capitalizingFirstLetter())
                            .padding(.trailing, proxy.size.width*0.1)
                            .padding(.bottom, proxy.size.height*0.015)
                    }
                }

            }.padding(.top, proxy.size.height*0.04)
            

            
            .navigationBarTitle("\(title)", displayMode: .automatic)
       
            
        }.accentColor(.black)
    }
}

/*
struct Galerie_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
*/
//bdd : sur le onappear on va demander à la bdd de récupérer tous les nft et les stocker dans un tableau, ce tableau sera ensuite passé dans la pushgalerie en be
