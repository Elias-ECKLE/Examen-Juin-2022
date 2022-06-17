//
//  blocNFT.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 17/06/2022.
//

import SwiftUI

struct blocNFT_Vente: View {
    
    let index:Int;
    let proxy:GeometryProxy;
    @Binding var utilisateurActuel: Utilisateur;
    
    var body: some View {
        VStack(alignment: .leading){
            Image(utilisateurActuel.nftDeUtilisateur[index].GetSource()).resizable().aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width*0.25, height: proxy.size.height*0.12, alignment: .center)
        
        }
        .frame(width: proxy.size.width*0.25, height: proxy.size.height*0.13, alignment: .center)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.17), radius: 6, x: 0, y: 4)
    }
}

/*
struct blocNFT_Previews: PreviewProvider {
    static var previews: some View {
        blocNFT()
    }
}
*/
