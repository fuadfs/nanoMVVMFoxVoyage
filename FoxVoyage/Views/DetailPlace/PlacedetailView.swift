//
//  PlacedetailView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct PlacedetailView: View {
    @StateObject var locationManager: LocationManager = .init()
    @State var places: [PlaceModel] = []
    @State private var showModal = false
    @State var name: String = ""
    var placeName : String
    //carousel
    @State private var index = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                // Carousel - Background Screen
                TabView(selection: $index) {
                    ZStack{
                        if !places.isEmpty{
                            Image(places[0].image)
//                            Image("forest")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }

                        VStack {
                            //TASK : MAKSIMAL 2 LINE
                            Text(name)
                            Text(placeName)
                                .font(.custom("SFProDisplay-Bold", size: 64))
                                .foregroundColor(.white)
                                .padding(.top, 50)
                            
                            Spacer()
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 999)
                                    .fill(Color.clear)
                                    .frame(width: 181, height: 48)
                                
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(Color.white, lineWidth: 1)
                                    .frame(width: 181, height: 48)
                                
                                //TASK: TAG
                                if !places.isEmpty{
                                    Text(places[0].tag)
                                        .font(.custom("SFProText-Medium", size: 15))
                                        .foregroundColor(.white)
                                }
                            }.padding(.bottom, 16)
                                .padding(.trailing, 170)
                            
                            //TASK: ALAMAT
                            if !places.isEmpty{
                                Text(places[0].address)
                                    .font(.custom("SFProText-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.trailing, 30)
                                    .padding(.bottom, 100)
                            }
                            
                            
                            
                            //TASK: SLIDE ANIMATION FOR CHECKIN
                            if !places.isEmpty{
                                if places[0].isCheckin == false {
                                    SlideButton("Slide to capture momen", styling: .init(indicatorColor: Color("Redish400"), backgroundColor: .white, textColor: .black, indicatorSystemName: "arrow.right", textHiddenBehindIndicator: false, textShimmers: true), callback: sliderCallback)
                                }
//                            }
//
//                            if locationManager.isCheckedIn {
//                                SlideButton("Slide to capture momen", styling: .init(indicatorColor: Color("Redish400"), backgroundColor: .white, textColor: .black, indicatorSystemName: "arrow.right", textHiddenBehindIndicator: false, textShimmers: true), callback: sliderCallback)
                            } else {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 999)
                                        .fill(Color.white)
                                        .frame(width: 325, height: 64)
    //                                Group{
    //                                    Circle()
    //                                        .frame(width: 56, height: 56)
    //                                        .foregroundColor(Color("Redish400"))
    //
    //                                    Image(systemName: "arrow.right")
    //                                        .foregroundColor(Color.white)
    //
    //                                }.padding(.trailing, 250)
    //
                                    Text("You Already Checked In")
                                        .padding(.leading, 30)
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
                            if !places.isEmpty{
                                Text(places[0].name)
                                    .font(.custom("SFProDisplay-SemiBold", size: 34))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 25)
                            }
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 999)
                                        .fill(Color.clear)
                                        .frame(width: 102, height: 48)
                                        
                                    
                                    RoundedRectangle(cornerRadius: 999)
                                        .stroke(Color.white, lineWidth: 1)
                                        .frame(width: 102, height: 48)
                                    
                                    //TASK: TAG
                                    if !places.isEmpty{
                                        Text(places[0].district)
                                            .font(.custom("SFProText-Medium", size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                VStack{
                                    Text("Operational hour")
                                        .font(.custom("SFProText-Regular", size: 15))
                                        .foregroundColor(.white)
                                    
                                    //TASK : JAM OPERASIONAL TEMPAT
                                    if !places.isEmpty{
                                        Text(places[0].operationalHour)
                                            .font(.custom("SFProDisplay-Regular", size: 20))
                                            .foregroundColor(.white)
                                    }
                                }.padding(.leading, 120)
                            }
                            
                            //TASK : GARIS PAS DARI UJUNG KE UJUNG
                            Rectangle()
                                .frame(width: 350, height: 1)
                                .foregroundColor(.white)
                                .padding(.top, 32)
                                
                            
                            //TASK : DESRICTION
                                    if !places.isEmpty{
                                        Text(places[0].desc)
                                            .frame(width: 358, height: 336)
                                            .font(.custom("SFProDisplay-Regular", size: 22))
                                            .foregroundColor(.white)
                                    }
                            
                            Spacer()
                            //TASK: SLIDE ANIMATION FOR CHECKIN
                            if locationManager.isCheckedIn {
                                SlideButton("Slide to capture momen", styling: .init(indicatorColor: Color("Redish400"), backgroundColor: .white, textColor: .black, indicatorSystemName: "arrow.right", textHiddenBehindIndicator: false, textShimmers: true), callback: sliderCallback)
                            } else {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 999)
                                        .fill(Color.white)
                                        .frame(width: 325, height: 64)
    //                                Group{
    //                                    Circle()
    //                                        .frame(width: 56, height: 56)
    //                                        .foregroundColor(Color("Redish400"))
    //
    //                                    Image(systemName: "arrow.right")
    //                                        .foregroundColor(Color.white)
    //
    //                                }.padding(.trailing, 250)
    //
                                    Text("You Already Checked In")
                                        .padding(.leading, 30)
                                }
                            }
                        }
                        
                            
                      
                    }.tag(1)
                    
                    ZStack{
                        if !places.isEmpty{
                            MissionCards(nameOfLocation: placeName,  typeOfLocation: places[0].tag)
                        }
//                        Color("Redish100")
//                            .aspectRatio(contentMode: .fill)
//                            .edgesIgnoringSafeArea(.all)
                            
                    }.tag(2)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(-1) // Set carousel to the backgroundp
                
                
            }
            
            //pagetabview carousel
            HStack(spacing: 8) {
                ForEach((0..<3), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color.white : Color.white.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 650)
            .padding(.horizontal, 164)
        }
        .onAppear{
            locationManager.manager.requestLocation()
            getPlace()
            
        }
        
    }
    
    private func sliderCallback() async {
        try? await Task.sleep(for: .seconds(2))
        print("checkin")
        
        showModal = true
        locationManager.isCheckedIn.toggle()
    }
    
    func getPlace() {
        places = CoreDataController.sharedInstance.fetchGetPlace(location: placeName)
        print("halooooo \(places[0].name)")
        
        name = places[0].name ?? ""
    }
    
//    func fetchPlaces(){
//        //taruh isloading
//        places = CoreDataController.sharedInstance.fetchPlaceModels()
//        //
//    }
    
}


struct PlacedetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlacedetailView(placeName: "Nuvasa Bay")
    }
}
