////
////  FavoriteView.swift
////  FoxVoyage
////
////  Created by Nindya Alita Rosalia on 30/07/23.
////
//
//import SwiftUI
//
//struct FavoriteView: View {
//    @Binding var selectedPlace: PlaceModel?
//    var selectedPlaces: [PlaceModel]
//
//        var body: some View {
//            VStack {
//                Text("Favorites")
//                    .font(.largeTitle)
//
//                ScrollView {
//                    ForEach(selectedPlaces) { place in
//                        Text(place.name) // Display the details of the selected places
//                    }
//                }
//            }
//        }
//}
//
//struct FavoriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteView(selectedPlace: .constant(nil))
//    }
//}
