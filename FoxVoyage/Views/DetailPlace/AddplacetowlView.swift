//
//  AddplacetowlView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 26/07/23.
//

import SwiftUI

struct AddplacetowlView: View {
    
    @State private var index = 0
    
    //addwishlist
    @State private var isAddTowishList = false
    
    //claim
    @State private var isClaim = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                // Carousel - Background Screen
                TabView(selection: $index) {
                    ZStack{
                        Image("forest")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        
                        VStack{
                            Spacer()
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.clear)
                                    .frame(width: 181, height: 48)
                                
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(Color.white, lineWidth: 1)
                                    .frame(width: 181, height: 48)
                                
                                //TASK: TAG
                                Text("Artificial Attraction")
                                    .font(.custom("SFProText-Medium", size: 15))
                                    .foregroundColor(.white)
                                
                                
                            }.padding(.trailing, 145)
                            
                            //TASK: NAMA TEMPAT
                            Text("Nuvasa Bay")
                                .font(.custom("SFProDisplay-Medium", size: 34))
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                                .padding(.trailing, 145)
                            
                            //TASK: ALAMAT
                            Text("Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau 29465")
                                .font(.custom("SFProText-Regular", size: 16))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 50)
                            
                            
                            Button(action:{
                                isAddTowishList.toggle()
                            }){
                                ZStack{
                                    Rectangle()
                                        .frame(width: 358, height: 64)
                                        .cornerRadius(999)
                                        .foregroundColor(.white)
                                    
                                    HStack{
                                        
                                        Text("Add to Wishlist")
                                            .font(.custom("SFProText-Medium", size: 17))
                                            .foregroundColor(Color("Black900"))
                                        
                                        Image(systemName: isAddTowishList ? "bookmark" : "checkmark")
                                            .foregroundColor(Color("Black900"))
                                    }
                                    
                                }
                            }
                        }
                            
                    }.tag(0)
                    
                    ZStack{
                        Color("Violet400")
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack (alignment: .leading){
                            Text("About")
                                .font(.custom("SFProText-Regular", size: 17))
                                .foregroundColor(.white)
                            
                            //TASK: NAMA TEMPAT
                            Text("Nuvasa Bay")
                                .font(.custom("SFProDisplay-SemiBold", size: 34))
                                .foregroundColor(.white)
                                .padding(.bottom, 25)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 999)
                                        .fill(Color.clear)
                                        .frame(width: 102, height: 48)
                                        
                                    
                                    RoundedRectangle(cornerRadius: 999)
                                        .stroke(Color.white, lineWidth: 1)
                                        .frame(width: 102, height: 48)
                                    
                                    //TASK: TAG
                                    Text("Nongsa")
                                        .font(.custom("SFProText-Medium", size: 15))
                                        .foregroundColor(.white)
                                }
                                
                                VStack{
                                    Text("Operational hour")
                                        .font(.custom("SFProText-Regular", size: 15))
                                        .foregroundColor(.white)
                                    
                                    //TASK : JAM OPERASIONAL TEMPAT
                                    Text("09:00 - 17:00")
                                        .font(.custom("SFProDisplay-Regular", size: 20))
                                        .foregroundColor(.white)
                                }.padding(.leading, 120)
                            }
                            
                            //TASK : GARIS PAS DARI UJUNG KE UJUNG
                            Rectangle()
                                .frame(width: 350, height: 1)
                                .foregroundColor(.white)
                                .padding(.top, 32)
                                
                            
                            //TASK : DESRICTION
                            Text("Nuvasa Bay is a beautiful and vibrant integrated resort destination located on the island of Batam, in the Riau Islands Province of Indonesia.Nestled along the sparkling coastline of the South China Sea, Nuvasa Bay offers a perfect blend of modern facilities, natural beauty, and exciting activities, making it an ideal getaway for travelers seeking a mix of relaxation and adventure")
                                .frame(width: 358, height: 336)
                                .font(.custom("SFProDisplay-Regular", size: 22))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action:{
                                isAddTowishList.toggle()
                            }){
                                ZStack{
                                    Rectangle()
                                        .frame(width: 358, height: 64)
                                        .cornerRadius(999)
                                        .foregroundColor(.white)
                                    
                                    HStack{
                                        
                                        Text("Add to Wishlist")
                                            .font(.custom("SFProText-Medium", size: 17))
                                            .foregroundColor(Color("Black900"))
                                        
                                        Image(systemName: isAddTowishList ? "bookmark" : "checkmark")
                                            .foregroundColor(Color("Black900"))
                                    }
                                    
                                }
                            }
                        }
                        
                        
                            
                    }.tag(1)
                    
                    
                    ZStack{
                        Color("Redish100")
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack (alignment: .leading){
                            HStack{
                                VStack (alignment: .leading){
                                    //TASK: NAMA TEMPAT
                                    Text("Nuvasa Bay")
                                        .font(.custom("SFProDisplay-SemiBold", size: 34))
                                        .foregroundColor(Color("Black900"))
                                        .padding(.top, -180)
                                    
                                    
                                    Text("Finish the quest to earn a stamp")
                                        .font(.custom("SFProText-Regular", size: 13))
                                        .foregroundColor(Color("Black600"))
                                        .padding(.top, -160)
                                    
                                    //TASK : BUTTON CLAIM
                                    Button(action:{
                                        isClaim.toggle()
                                    }){
                                        
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 148, height: 48)
                                                .cornerRadius(999)
                                                .foregroundColor(isClaim ? Color("Black400") : Color("Redish400"))
                                            HStack{
                                                Text("Claim")
                                                    .font(.custom("SFProText-Medium", size: 15))
                                                    .foregroundColor(isClaim ? Color("Black200") : Color(.white) )
                                                Image(systemName: "arrow.up.right")
                                                    .foregroundColor(Color("Black200"))
                                            }
                                            
                                        }
                                    } .padding(.top, -140)
                                }.padding(.top, -80)
                                Image("badges")
                                    .padding(.top, -260)
                                    .padding(.trailing, -100)

                            }

                            
                            
                                
                            
                            //TASK: CARD MISSION
                            CardMission()
                                .padding(.top, -110)
                           
                            
                        }
                    }.tag(2)

                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(-1) // Set carousel to the backgroundp
            
                //pagetabview carousel
                HStack(spacing: 8) {
                    ForEach((0..<3), id: \.self) { index in
                        Circle()
                            .fill(index == self.index ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.top, 570)
                .padding(.horizontal, 160)
            }
        }
    }
}

struct CardMission: View{
    var body: some View{
        //TASK : CARD MISSION
        ZStack{
            Rectangle()
                .frame(width: 358, height: 174)
                .cornerRadius(30)
                .foregroundColor(.white)
            
            //TASK: NAMA MISI --> maksimal 4 kata perbaris
            VStack (alignment:.leading){
                HStack{
                    VStack{
                        //TASK : NAMA MISI
                        Text("Water and beach activities")
                            .font(.custom("SFProDisplay-Medium", size: 20))
                            .foregroundColor(Color("Black900"))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        //DESCRIPTION MISISION
                        Text("Enjoy the crystal-clear waters of the South \nChina Sea by indulging in a variety of\nwater sports.")
                            .font(.custom("SFProText-Regular", size: 11))
                            .foregroundColor(Color("Black600"))
                    }.padding(.top, -50)
                    //TASK : AKAN BERUBAH MENJADI GIFT KETIKA TELAH SELESAIKAN MISI
                    Image("lockedmission")
                        .padding(.top, -30)
                }
                
                Button(action: {}, label: {
                    Text("Add your photo here")
                        .font(.custom("SFProText-Regular", size: 16))
                        .foregroundColor(Color("Redish400"))
                        .underline()
                        .padding(.bottom, -20)
                })
                
            }
            
        }
    }
    
}

struct AddplacetowlView_Previews: PreviewProvider {
    static var previews: some View {
        AddplacetowlView()
    }
}
