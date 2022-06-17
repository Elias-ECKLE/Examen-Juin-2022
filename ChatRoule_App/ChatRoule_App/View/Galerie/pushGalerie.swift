//
//  pushGalerie.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct pushGalerie: View {
    
    //let chatons:[Nft];
    let proxy:GeometryProxy;
    let chaton: Nft;
    
    var body: some View {
        VStack{
            Image(chaton.GetSource())
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width*0.6,
                       height: proxy.size.height*0.6,
                       alignment: .center)
                .padding(.top, proxy.size.height*(-0.15))
            
            Text(chaton.GetNom().capitalizingFirstLetter()).font(.largeTitle).bold()
                .padding(.top, proxy.size.height*(-0.05))
            
            Spacer()
            
            Text(chaton.GetDescription().capitalizingFirstLetter())
                .frame(width:proxy.size.width*0.87, height:proxy.size.height*0.3, alignment: .leading)
                .padding(.top, proxy.size.height*(-0.1))
            
            Spacer()
              
            
        }
       
       
    }
}

/*
struct pushGalerie_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
*/
