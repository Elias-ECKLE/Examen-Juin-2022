//
//  ContentView.swift
//  ChatRoule_App
//
//  Created by Elias ECKLE on 15/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var BDD:BDD_Helper;
    @Binding var utilisateurActuel: Utilisateur;
    
    //variable qui gère la page sélectionnée : 5 principales pages rangées dans le dossier "principal pages"
    @State var selectedView: Int = 0;
    
    //tableau contenant les 3 pages associées
    @State var arrayViews: Array<CView> = [
        CView(name:"Accueil", titleNav:"Bonjour"),
        CView(name:"Galerie", titleNav:"Galerie de chatons"),
        CView(name:"Boutique", titleNav:"La Boutique NFT"),]

    
    var body: some View {
        
        GeometryReader { proxy in
            VStack{
            
                switch selectedView {
                case 1:
                    Galerie(BDD:$BDD, utilisateurActuel : $utilisateurActuel, title:arrayViews[1].titleNav, proxy: proxy)
                case 2:
                    Boutique(BDD:$BDD, utilisateurActuel : $utilisateurActuel, title:arrayViews[2].titleNav, proxy:proxy)
                default:
                    Accueil(BDD:$BDD, utilisateurActuel : $utilisateurActuel,title:arrayViews[0].titleNav, proxy:proxy)
                }
                
                
                
                //tabbar
                TabBar(selectedView: $selectedView, arrayViews: $arrayViews)
                
                
                
            }.onAppear(){
                //on purge et on récupère l'ensemble des nft détenus pas le
                utilisateurActuel.nftDeUtilisateur.removeAll();
                utilisateurActuel.nftDeUtilisateur = BDD.NFTUtilisateur(utilisateur: utilisateurActuel);
                utilisateurActuel.nftA_Acheter.removeAll();
                utilisateurActuel.nftA_Acheter = BDD.NFTSurMarche();
            }
        }

    }
}

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 */


struct TabBar: View{
    @Binding var selectedView: Int;
    @Binding var arrayViews: Array<CView>;

    
    var body: some View{
      
        Divider()
            .background(Color.white)
            .offset(y:-8)
        VStack{

            HStack(alignment: .center){
                
                ForEach(0..<3){ index in
                    Spacer();
                    VStack{
                        Button{
                         selectedView = index
                        }
                        label: {
                            if selectedView == index{
                                Image(arrayViews[index].imgIconFill).opacity(1)
                            }
                            else{
                                Image(arrayViews[index].imgIcon)
                            }
                          
                        }
                    }
                    Spacer();
                }

            }
        }

        .padding(.top, 10)
        .padding(.bottom, 14)
        .padding(.leading, 3)

        
    }
}
