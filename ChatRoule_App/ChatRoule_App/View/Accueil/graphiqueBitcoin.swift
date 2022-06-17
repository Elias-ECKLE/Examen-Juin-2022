//
//  graphiqueBourse.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 16/06/2022.
//

import SwiftUI

struct graphiqueBitcoin: View {
    
    let proxy:GeometryProxy;
    
    var body: some View {
        
        VStack(alignment:.center){
            RoundedRectangle(cornerRadius:10)
                .frame(
                    width:proxy.size.width*0.82,
                    height:proxy.size.height*0.23,
                    alignment:.center)
                .opacity(0.2)
                .shadow(color: Color.black.opacity(0.17), radius: 6, x: 0, y: 4)
        }.padding(.leading, proxy.size.width*0.05)
       
      
            
    }
}

/*
struct graphiqueBitcoin_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */
