//
//  MomentsCapturedView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 26/07/23.
//

import SwiftUI

struct MomentsCapturedView: View {
    var body: some View {
      
            ZStack{
                VStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 400, height: 553)
                        .background(
                            Image("cafe")
                                .resizable()
                                .clipped()
                                .ignoresSafeArea()
                                .opacity(0.8)
                                .overlay(Color.black.opacity(0.5))
                        )

                    Spacer()
                }
                VStack{
                    VStack{
                        HStack{
                            Image(systemName: "chevron.left")
                                .padding(.horizontal, 9)
                                .foregroundColor(.white)
                            
                            Text("Label")
                                .font(Font.custom("SF Pro Text", size: 17))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical)
                        .frame(width: 390, alignment: .topLeading)
                        
                        
                        
                        Text("hari ini seneng banget deh gatau mau ngapain selain bersyukur.")
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 358, alignment: .topLeading)
                            .padding(.top,370)
                    }
                    .frame(height:500)
                    //View ini harusnya bisa discroll dan background menutup gambar
                    ScrollView{
                    VStack{
                        HStack(spacing:16){
                            VStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 155, height: 152)
                                    .background(
                                        Image("place1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 155, height: 152)
                                            .clipped())
                                Text("Fri 21 July")
                                    .font(
                                        Font.custom("SF Mono", size: 13)
                                            .weight(.medium)
                                    )
                                    .padding(.bottom)
                            }
                            .padding(.horizontal, 7.46369)
                            .padding(.top, 7.46369)
                            .padding(.bottom, 14.92737)
                            .background(.white)
                            
                            VStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 155, height: 152)
                                    .background(
                                        Image("place1")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 155, height: 152)
                                            .clipped())
                                Text("Fri 21 July")
                                    .font(
                                        Font.custom("SF Mono", size: 13)
                                            .weight(.medium)
                                    )
                                    .padding(.bottom)
                            }
                            .padding(.horizontal, 7.46369)
                            .padding(.top, 7.46369)
                            .padding(.bottom, 14.92737)
                            .background(.white)
                            
                        }
                        .padding(.top,8)
                    }
                }
                   Spacer()
                }
                .padding(.top,56)
                
                
                
                
            }
            .frame(width: 400, height: 844)
            .background(Color(red: 1, green: 0.98, blue: 0.95))
            .cornerRadius(54)
            .ignoresSafeArea()

         
        
    }
}

struct MomentsCapturedView_Previews: PreviewProvider {
    static var previews: some View {
        MomentsCapturedView()
    }
}
