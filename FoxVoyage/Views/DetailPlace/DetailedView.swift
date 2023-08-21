//
//  DetailedView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 26/07/23.
//

import SwiftUI



struct DetailedView: View {
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading){
                Image("exampleimage1")
                    .resizable()
                    .frame(width: 400, height: 291)
                    .ignoresSafeArea()
                
                Color.black.opacity(0.5)
                    .frame(width: 400, height: 291)
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
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
                    HStack{
                        Text("Nuvasa Bay")
                            .foregroundColor(.white)
                            .font(Font.custom("SF Pro Display", size: 34))
                            .padding(.leading)
                        Image(systemName: "arrow.up.forward")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 390, alignment: .leading)
                    
                    HStack{
                        Text("July 2023")
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 5))
                            .foregroundColor(.white)
                        
                        Text("2 check in")
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(width: 390, alignment: .leading)
                    HStack{
                        Text("Prograss")
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("1/3")
                            .font(Font.custom("SF Pro Text", size: 16))
                            .foregroundColor(.white)
                            .padding(.trailing)
                    }
                    .frame(width: 390, alignment: .leading)
                    .padding(.top, 40)
                    
                    ZStack(alignment: .leading){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 358, height: 8)
                            .background(Color(red: 1, green: 0.98, blue: 0.95))
                            .cornerRadius(99)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 119.33334, height: 8)
                            .background(Color(red: 0.77, green: 0.35, blue: 0.23))
                            .cornerRadius(99)
                        
                        
                    }
                    
                }
            }
            .frame(height: 250)
            
            //Memories View
            ScrollView{
            VStack{
                MomentCardView(moment: momentList[0])
                MomentCardView(moment: momentList[1])
                VStack(alignment: .leading, spacing: 8){
                    Text("Wednesday, 23 Nov 07:16 AM")
                        .font(Font.custom("SF Pro Text", size: 16))
                        .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.63))
                    
                    VStack(alignment: .leading){
                        
                        HStack(spacing: 0){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 159.5363, height: 126.88268)
                                .background(
                                    Image("place1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 159.5363006591797, height: 126.88268280029297)
                                        .clipped())
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 159.5363, height: 126.88268)
                                .background(
                                    Image("place2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 159.5363006591797, height: 126.88268280029297)
                                        .clipped())
                            
                        }
                        Text("Moments captured")
                            .font(Font.custom("SF Pro Text", size: 14.92737))
                            .padding(.leading)
                        Text("4")
                            .font(
                                Font.custom("SF Pro Display", size: 18.65922)
                                    .weight(.medium))
                            .padding(.leading)
                            .padding(.vertical,1)
                        
                    }
                    .padding(.horizontal, 7.46369)
                    .padding(.top, 7.46369)
                    .padding(.bottom, 14.92737)
                    .background(Color(red: 1, green: 0.98, blue: 0.95))
                    .cornerRadius(30)
                    
                    
                }
                VStack(alignment: .leading, spacing: 8){
                    Text("Wednesday, 23 Nov 07:16 AM")
                        .font(Font.custom("SF Pro Text", size: 16))
                        .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.63))
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 0){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 159.5363, height: 126.88268)
                                .background(
                                    Image("place1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 159.5363006591797, height: 126.88268280029297)
                                        .clipped())
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 159.5363, height: 126.88268)
                                .background(
                                    Image("place2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 159.5363006591797, height: 126.88268280029297)
                                        .clipped())
                            
                        }
                        Text("Moments captured")
                            .font(Font.custom("SF Pro Text", size: 14.92737))
                            .padding(.leading)
                        Text("4")
                            .font(
                                Font.custom("SF Pro Display", size: 18.65922)
                                    .weight(.medium))
                            .padding(.leading)
                            .padding(.vertical,1)
                        
                    }
                    .padding(.horizontal, 7.46369)
                    .padding(.top, 7.46369)
                    .padding(.bottom, 14.92737)
                    .background(Color(red: 1, green: 0.98, blue: 0.95))
                    .cornerRadius(30)
                    
                    
                }
            }
            .padding(.leading, 32)
        }
            Spacer()
        }
       
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
