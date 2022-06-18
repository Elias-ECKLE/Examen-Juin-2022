//
//  Boutique.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct Boutique: View {
    
    @State var showingSheetAchat = false;
    @State var showingSheetVente = false;
    @State var indexAchat = -1;
    @State var indexVente = -1;
    
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
                        .padding(.leading, proxy.size.width*0.05)
                    
                    //Lazy Grid.....
                     let columns = Array(repeating: GridItem(.flexible()), count: 3);
                     
                    LazyVGrid(columns: columns, spacing: proxy.size.height*0.05){
                        ForEach(0..<utilisateurActuel.nftA_Acheter.count){valueAchat in
                            Button(){
                                indexAchat = valueAchat;
                                showingSheetAchat = true;
                          
                            }label:{
                                blocNFT_Achat(index: valueAchat, proxy: self.proxy, utilisateurActuel: $utilisateurActuel)
                    
          
                            }.sheet(isPresented: $showingSheetAchat){
                                modalAchatBoutique(showingSheet: $showingSheetAchat, utilisateurActuel: $utilisateurActuel, index: $indexAchat, proxy: self.proxy);
                              
                            }
                            
                                 
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
                        ForEach(0..<utilisateurActuel.nftDeUtilisateur.count){valueVente in
                            Button(){
                                indexVente = valueVente;
                                showingSheetVente = true;
                          
                            }label:{
                                blocNFT_Vente(index: valueVente, proxy: self.proxy, utilisateurActuel: $utilisateurActuel)
       
          
                            }.sheet(isPresented: $showingSheetVente){
                                modalVenteBoutique(showingSheet: $showingSheetVente, utilisateurActuel: $utilisateurActuel, index: $indexVente, proxy: self.proxy);
                              
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
