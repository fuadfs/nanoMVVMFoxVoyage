//
//  LocalSearchService.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 29/07/23.
//

import Foundation
import MapKit
import Combine

class LocalSearchService: ObservableObject {
    
//    let placemark: MKPlacemark
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    let locationManager = LocationManager()
    var cancellables = Set<AnyCancellable>()
//    @Published var places: [PlaceModel] = []
//    @Published var place: PlaceModel?
    
    init() {
        locationManager.$region.assign(to: \.region, on: self)
            .store(in: &cancellables)
    }
    
    func search(query: String) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = locationManager.region
        
//        let search = MKLocalSearch(request: request)
//        search.start { response, error in
//            if let response = response {
//                let mapItems = response.mapItems
//                self.places = mapItems.map {
//                    PlaceModel(placemark: self.placemark.$0)
//                }
//
//            }
//        }
        
        
    }
}

