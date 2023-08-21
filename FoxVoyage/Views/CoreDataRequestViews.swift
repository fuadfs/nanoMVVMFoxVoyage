//
//  CoreDataRequestViews.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import SwiftUI

struct CoreDataRequestViews: View {
    @State var places: [PlaceModel] = []
    @State var isLoading = false
    
    var body: some View {
        VStack{
            
            if isLoading{
                ProgressView()
            }else {
                ForEach(places) { place in
                    Text(place.tag)
                }
            }
            
            
        }.onAppear {
            isLoading = true
            places = CoreDataController.sharedInstance.fetchPlaceModels()
            isLoading = false
        }
    }
}

struct CoreDataRequestViews_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRequestViews()
    }
}
