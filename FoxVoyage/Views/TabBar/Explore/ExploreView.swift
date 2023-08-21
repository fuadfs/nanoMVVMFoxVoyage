//
//  ExploreView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 21/07/23.
//

import SwiftUI

struct ExploreView: View {
    
    @EnvironmentObject var router: Router
    
    @StateObject var locationManager: LocationManager = .init()
    @State var places: [PlaceModel] = []
    //addwishlist
    @State private var isAddTowishList = false
    
    @State private var showModal = false
    
    @ObservedObject var appState = AppState.shared
    @State var navigate = false
    
    var pushNavigationBinding : Binding<Bool> {
        .init { () -> Bool in
            appState.pageToNavigationTo != nil
        } set: { (newValue) in
            if !newValue { appState.pageToNavigationTo = nil }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    HStack{
                        //profile photo
                        ZStack{
                            Circle()
                                .frame(width: 72, height: 72)
                                .foregroundColor(Color("Redish400"))
                            Image(systemName: "person.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.white)
                        }.padding(.leading, 30)
                        
                        
                        Spacer()
                        
                        //sum
                        ZStack{
                            RoundedRectangle(cornerRadius: 999)
                                .frame(width: 105, height: 56)
                                .foregroundColor(Color("Redish100"))
                            
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color("Green200"))
                                    
                                    //TASK : GANTI DENGAN ICON
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.white)
                                }
                                
                                //TASK : DATA
                                Text("0")
                                    .font(.custom("SFProDisplay-Medium", size: 20))
                                
                                
                            }.padding(.leading, -25)
                            
                            
                        }.padding(.trailing)
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 999)
                                .frame(width: 105, height: 56)
                                .foregroundColor(Color("Redish100"))
                            HStack{
                                ZStack{
                                    Circle()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color("Green200"))
                                    
                                    //TASK : GANTI DENGAN ICON
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.white)
                                }
                                
                                //TASK : DATA
                                Text("0")
                                    .font(.custom("SFProDisplay-Medium", size: 20))
                                
                                
                            }.padding(.leading, -25)
                            
                            
                        }.padding(.trailing, 30)
                    }
                    
                    Text("Your Current Location")
                        .font(.custom("SFProDisplay-Regular", size: 22))
                        .padding(.leading, -150)
                        .padding(.top, 10)
                    
                    //checkin
                    ZStack{
                        Rectangle()
                            .frame(width: 358, height: 163)
                            .cornerRadius(30)
                            .foregroundColor(Color("Redish100"))
                            .padding(.horizontal, 16)
                        
                        VStack{
                            
                            HStack (spacing: 50){
                                
                                //TASK : NAMA TEMPAT
                                Text(locationManager.placeToCheckIn)
                                    .font(.custom("SFProDisplay-Medium", size: 28))
                                    .foregroundColor(Color("Black900"))
                                    .padding(.leading, -5)
                                
                                VStack{
                                    Text("Misi")
                                        .font(.custom("SFProText-Regular", size: 16))
                                        .foregroundColor(Color("Black900"))
                                    //TASK : JUMLAH MISI
                                    Text("3")
                                        .font(.custom("SFProDisplay-Medium", size: 20))
                                        .foregroundColor(Color("Black900"))
                                }.padding(.leading, 50)
                                
                                VStack{
                                    Text("Jarak")
                                        .font(.custom("SFProText-Regular", size: 16))
                                        .foregroundColor(Color("Black900"))
                                    
                                    //TASK : JARAK
                                    Text("1.8 km")
                                        .font(.custom("SFProDisplay-Medium", size: 20))
                                        .foregroundColor(Color("Black900"))
                                }
                                
                                
                            }
                            
                            //TASK : ANIMASI SLIDE TO CHECKIN
                            if !locationManager.isCheckedIn {
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
                    }
                    
                    //popular group
                    Group{
                        HStack{
                            Text("Popular")
                                .font(.custom("SFProDisplay-Regular", size: 22))
                                .padding(.leading, -170)
                        }.padding(.horizontal, 40)
                            .padding(.top, 24)
                        
                        if !places.isEmpty{
                            HStack (spacing: 30){
                                PopularPlaceCard(place: places[0])
                                PopularPlaceCard(place: places[1])
                                
    //                                                    ForEach(places){ place in
    //                                                        PopularPlaceCard(place: place)
    //                                                    }
                            }
                        } else{
                            ProgressView()
                        }
                        
                        
                    }
                    
                    Group{
                        HStack{
                            Text("Place Near You")
                                .font(.custom("SFProDisplay-Regular", size: 22))
                                .padding(.leading, -20)
                                
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("See all")
                                    .font(.custom("SFProText-Regular", size: 15))
                                    .foregroundColor(Color("Redish400"))
                                    .underline()
                            })
                        }.padding(.horizontal, 40)
                            .padding(.top, 24)
                        
                        
                        //NEARPLACECARDVIEW
                        
                        if !places.isEmpty{
                            VStack (spacing: 30){
                                NearPlaceCardView(place: places[0])
                                NearPlaceCardView(place: places[4])
                                
                            }
                        } else{
                            ProgressView()
                        }
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                }
                
                Group{
                    HStack{
                        Text("Place Near You")
                            .font(.custom("SFProDisplay-Regular", size: 22))
                            .padding(.leading, -20)
                            
                        
                        Spacer()
                        
                        Button{
                            router.push(.exploreAll)
                        }label: {
                            Text("See all")
                                .font(.custom("SFProText-Regular", size: 15))
                                .foregroundColor(Color("Redish400"))
                                .underline()
                        }
                        
                    }.padding(.horizontal, 40)
                        .padding(.top, 24)
                    
                    
                    //NEARPLACECARDVIEW
                    
                    if !places.isEmpty{
                        VStack (spacing: 30){
                            NearPlaceCardView(place: places[0])
                            NearPlaceCardView(place: places[1])
                            
                        }
                    } else{
                        ProgressView()
                    }
                    
                }
                
                
                
                Spacer()
                
                
            }
            .overlay(NavigationLink(destination: PlacedetailView(placeName: appState.pageToNavigationTo ?? ""),
                                    isActive: pushNavigationBinding) {
                EmptyView()
            })
            
                
        }
        
        
        
        
        .onAppear{
            locationManager.manager.requestLocation()
            fetchPlaces()
        }
    }
    
    func fetchPlaces(){
        //taruh isloading
        places = CoreDataController.sharedInstance.fetchPlaceModels()
        //
    }
    
    private func sliderCallback() async {
        try? await Task.sleep(for: .seconds(2))
        print("checkin")
        router.push(.takepic)
        showModal = true
        print(showModal)
        locationManager.isCheckedIn.toggle()
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("This is a modal!")
                .padding()

            Button("Dismiss") {
                dismiss()
            }
            .padding()
        }
    }
}
