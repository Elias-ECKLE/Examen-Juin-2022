//
//  CView.swift
//  AppProductivity
//
//  Created by Elias ECKLE on 10/03/2022.
//

import Foundation
import SwiftUI



struct CView{
    var name:String
   public  var titleNav:String
    var imgIcon: String{
        get{
            return name
        }
    }
    
    var imgIconFill: String{
        get{
            return imgIcon+"_Fill";
        }
    }
    


    

}
