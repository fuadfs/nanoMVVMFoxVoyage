//
//  JorneyfilledView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 26/07/23.
//

import SwiftUI

struct JorneyfilledView: View {
    var body: some View {
        HStack{
            
            ZStack{
                Image("forest2")
                    .resizable()
                    .frame(width: 358, height: 160)
                
                VStack (spacing:5){
                    HStack(spacing: 32){
                        
                        Text("July")
                            .foregroundColor(Color.white)
                            .font(.custom("SFProText-Regular", size: 16))
                        
                        Text("CheckIn")
                            .foregroundColor(Color.white)
                            .font(.custom("SFProText-Regular", size: 16))
                    }.padding(.leading, 140)
                        
                    
                    HStack (spacing: 40){
                        Text("July")
                            .foregroundColor(Color.white)
                            .font(.custom("SFProDisplay-Medium", size: 22))
                            
                        
                        Text("18")
                            .foregroundColor(Color.white)
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            .padding(.leading, 80)
                        
                        Text("2")
                            .foregroundColor(Color.white)
                            .font(.custom("SFProDisplay-Medium", size: 20))
                    }.padding(.leading, -60)
                    
                }.padding(.top, 80)
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Map")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct JorneyfilledView_Previews: PreviewProvider {
    static var previews: some View {
        JorneyfilledView()
    }
}
