//
//  modalVenteBoutique.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct modalVenteBoutique: View {
    
    @State var showingAlert = false;
    @Binding var showingSheet:Bool;
    @Binding var utilisateurActuel: Utilisateur;
    

    @Binding var index:Int;
    let proxy:GeometryProxy;
 
    
    
    
    var body: some View {
        
        VStack{
            VStack{
                Image(utilisateurActuel.nftDeUtilisateur[index].GetSource())
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width*0.4,
                           height: proxy.size.height*0.4,
                           alignment: .center)
                  
                
                Text(utilisateurActuel.nftDeUtilisateur[index].GetNom().capitalizingFirstLetter()).font(.largeTitle).bold()
                    .padding(.top, proxy.size.height*(-0.05))
                
        
                
            }
            
            Spacer();
            
            
            VStack{
             
                HStack{
                    Text("Prix actuel")
                    Spacer()
                    Text("Prix à calculer").bold()
           
                }
                Divider()
                Spacer()
                HStack{
                    Text("Prix de départ")
                    Spacer()
                    Text(String(utilisateurActuel.nftDeUtilisateur[index].GetPrixDepart()) + " € ").bold()
                 
                }
                Divider()
                Spacer()
                HStack{
              
                    Text("Auteur")
                    Spacer()
                    Text(utilisateurActuel.nftDeUtilisateur[index].GetAuteur().GetPrenom().capitalizingFirstLetter()
                         + " " +
                         utilisateurActuel.nftDeUtilisateur[index].GetAuteur().GetNom().capitalizingFirstLetter())
                        .bold();
                }
                
            }
            .frame(
                width:proxy.size.width*0.8,
                height: proxy.size.height*0.2,
                alignment: .leading)
            
         
            Spacer();
            
            VStack{
                Button{
                    showingSheet = false;
                }label:{
                    Text("ANNULER").padding(.trailing, proxy.size.width*0.022)
                        .font(.custom("CircularStd-Book" ,size:proxy.size.width*0.038))
                        .foregroundColor(Color.black)
                        .frame(
                            width:proxy.size.width*0.80,
                            height:proxy.size.width*0.09,
                            alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
     
          
                        .shadow(color: Color.black.opacity(0.24), radius: 8, x: 0, y: 4)
            }
                Button{
                    showingAlert.toggle()
                }label:{
                    Text("VENDRE").padding(.trailing, proxy.size.width*0.022)
                        .font(.custom("CircularStd-Book" ,size:proxy.size.width*0.038))
                        .foregroundColor(Color.white)
                        .frame(
                            width:proxy.size.width*0.80,
                            height:proxy.size.width*0.09,
                            alignment: .center)
                        .background(Color("colorInteractive"))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.24), radius: 8, x: 0, y: 4)
            }.alert("Fonctionnalité à venir", isPresented: $showingAlert){
                Button("Ok ", role: .cancel){}
            }
        }
       
    }
}

}
    /*


struct modalVenteBoutique_Previews: PreviewProvider {
    static var previews: some View {
        modalVenteBoutique()
    }
}
*/
