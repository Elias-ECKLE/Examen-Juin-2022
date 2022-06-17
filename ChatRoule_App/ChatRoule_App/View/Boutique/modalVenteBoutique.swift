//
//  modalVenteBoutique.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct modalVenteBoutique: View {
    
    let proxy:GeometryProxy;
    let chaton: Nft;
    
    
    var body: some View {
        
        VStack{
            VStack{
                Image(chaton.GetSource())
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width*0.4,
                           height: proxy.size.height*0.4,
                           alignment: .center)
                  
                
                Text(chaton.GetNom().capitalizingFirstLetter()).font(.largeTitle).bold()
                    .padding(.top, proxy.size.height*(-0.05))
                
                
                
            }
            VStack{
                HStack{
                    Text("Prix actuel")
                    Spacer()
                    Text("Prix à calculer")
                }
                HStack{
                    Text("Prix de départ")
                    Spacer()
                    Text(String(chaton.GetPrixDepart()) + " € ")
                }
                HStack{
                    Text("Auteur")
                    Spacer()
                    Text("Auteur à venir")
                }
            }
            
         
            
            VStack{
                Button{
   
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
                        .padding(.top, proxy.size.height*0.060)
          
                        .shadow(color: Color.black.opacity(0.24), radius: 8, x: 0, y: 4)
            }
                Button{
   
                }label:{
                    Text("ACHETER").padding(.trailing, proxy.size.width*0.022)
                        .font(.custom("CircularStd-Book" ,size:proxy.size.width*0.038))
                        .foregroundColor(Color.white)
                        .frame(
                            width:proxy.size.width*0.80,
                            height:proxy.size.width*0.09,
                            alignment: .center)
                        .background(Color("colorInteractive"))
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.24), radius: 8, x: 0, y: 4)
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
