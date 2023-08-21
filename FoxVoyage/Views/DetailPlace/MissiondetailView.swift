//
//  MissiondetailView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct MissiondetailView: View {
    @State private var index = 0
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                // Carousel - Background Screen
                TabView(selection: $index) {
                    Image("forest")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(0)
                    Image("cafe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(1)
                    Image("forest")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(-1) // Set carousel to the backgroundp
                
                
                ZStack{
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.white)
                    Image(systemName: "xmark")
                }
                .padding(.bottom, 680)
                .padding(.leading, 320)
                
                
                
                //elemen
                ZStack{
                    Rectangle()
                        .frame(width: 358, height: 118)
                        .cornerRadius(30)
                        .foregroundColor(Color.white)
                    
                    VStack(spacing: 0){
                        Text("Mencoba makanan pak \nslamet cihuy")
                            .font(.custom("SFProText-Medium", size: 22))
                            .padding(.trailing, 80)
                        HStack (spacing: 60){
                            Text("Tambahkan Foto")
                                .font(.custom("SFProText-Regular", size: 17))
                                .foregroundColor(Color("Black400"))
                            
                            ZStack{
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color("Redish400"))
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                            }.padding(.leading, 90)

                        }

                        
                    }
                    
                }
                .padding(.top, 629)

             
            }
            //pagetabview carousel
            HStack(spacing: 8) {
                ForEach((0..<3), id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(index == self.index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 116, height: 6)
                }
            }
            .padding(.horizontal, 15)
        }
    }
}



struct MissiondetailView_Previews: PreviewProvider {
    static var previews: some View {
        MissiondetailView()
    }
}
