//
//  Boutique.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct Boutique: View {
    
    @State var showingSheet = false;
    
    @Binding var BDD:BDD_Helper;
    @Binding var utilisateurActuel: Utilisateur;
    
    let title:String;
    let proxy:GeometryProxy;
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                VStack(alignment:.leading){
                    Text("Achats de chatons ")
                        .font(.title2)
                        .frame(width:proxy.size.width*0.7, alignment: .leading)
                        //.padding(.trailing, proxy.size.width*0.20)
                        .padding(.top, proxy.size.width*0.06)
                    
                    //Lazy Grid.....
                     let columns = Array(repeating: GridItem(.flexible()), count: 3);
                     
                    LazyVGrid(columns: columns, spacing: proxy.size.height*0.05){
                        ForEach(0..<utilisateurActuel.nftA_Acheter.count){value in
                            blocNFT_Achat(index: value, proxy: self.proxy, utilisateurActuel: $utilisateurActuel)
                                 
                         }
                     }
   
                }.padding(.top, proxy.size.height*0.13)
               
                

                VStack{
                    Text("Vente de vos chatons NFT")
                        .font(.title2)
                        .frame(width:proxy.size.width*0.91, alignment: .leading)
                        //.padding(.trailing, proxy.size.width)
                        .padding(.top, proxy.size.width*0.095)
                    
                    //Lazy Grid.....
                     let columns2 = Array(repeating: GridItem(.flexible()), count: 3);
                     
                    LazyVGrid(columns: columns2, spacing: proxy.size.height*0.06){
                        ForEach(0..<utilisateurActuel.nftDeUtilisateur.count){value in
                            Button(){
                                showingSheet.toggle();
                            }label:{
                                blocNFT_Vente(index: value, proxy: self.proxy, utilisateurActuel: $utilisateurActuel)
                            }.sheet(isPresented: $showingSheet){
                                modalVenteBoutique(proxy: self.proxy, chaton: utilisateurActuel.nftDeUtilisateur[value]);
                            }
                            
                                 
                         }
                     }
                     .frame(height:proxy.size.height*0.5, alignment: .top)
                     
                }

            }.onAppear{
           
            }
            
            .navigationBarTitle("\(title) ", displayMode: .automatic)
        
            
        }
    }
}

/*
struct Boutique_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */
