//
//  ExploreallView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 28/07/23.
//

import SwiftUI

struct ExploreallView: View {
    
    @State var searchText = ""
    
    private let categories = ["All", "Beach", "Park", "Artificial Attraction", "Natural Attraction"]
    @State private var currentTab: Int = 0
    
    @State var places: [PlaceModel] = []
    
    
    //    //addwishlist
    //    @State private var isAddTowishList = false
    
    var filteredPlaces: [PlaceModel] {
        
        if self.currentTab == 0{
            return places
        }
        return places.filter({$0.tag == self.categories[self.currentTab]})
    }
    
    //    @State var searchText = ""
    
    var body: some View {
        
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 358, height: 156)
                    .cornerRadius(30)
                    .foregroundColor(Color("Redish100"))
                
                VStack{
                    
                    Text("Create unforgettable moments in \nthe most remarkable places!")
                        .font(.custom("SFProDisplay-Regular", size: 22))
                    
                    //TASK : SEARCH
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        
                        TextField("search in Kota Batam", text: $searchText)
                            .font(.custom("SFProDisplay-Regular", size: 17))
                            .foregroundColor(Color("Redish400"))
                            .padding(.trailing, 12.0)
                            .frame(maxWidth: 250, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 0)
                    .frame(width: 321, height: 52, alignment: .leading)
                    .cornerRadius(999)
                    .overlay(
                        RoundedRectangle(cornerRadius: 999)
                            .inset(by: 0.5)
                            .stroke(Color("Redish400"), lineWidth: 1)
                    )
                }
            }
            VStack (alignment: .leading) {
                ScrollView(.horizontal){
                    HStack {
                        ForEach(0...categories.count - 1, id:\.self) { i in
                            TabProfile (isActive: i == currentTab, text: categories[i])
                                .onTapGesture {
                                    currentTab = i
                                    print(currentTab)
                                }
                        }
                    }
                }.scrollIndicators(.hidden)
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                
                Divider()
                
                ScrollView{
                    if !filteredPlaces.isEmpty{
                        VStack(spacing: 16){
                            ForEach(filteredPlaces) { place in
                                NearPlaceCardView(place: place)
                            }
                        }
                        
                        .padding(.horizontal, 16)
                        .padding(.top, 30)
                    }
                }
                
                    .scrollIndicators(.hidden)
                
                
            }
        }
        .onAppear{
            fetchPlaces()
        }
        
        
        
    }
    
    
    func fetchPlaces(){
        //taruh isloading
        places = CoreDataController.sharedInstance.fetchPlaceModels()
        //
    }
    
    
}
struct ExploreallView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreallView()
    }
}
