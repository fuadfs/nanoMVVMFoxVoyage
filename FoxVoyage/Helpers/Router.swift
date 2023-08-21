//
//  Router.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 30/07/23.
//

import SwiftUI

enum Route: Hashable{
    case onboarding
    case galleryAccess
    case explore
    case infoLocation
    case infoLocationSearch(locationManager: LocationManager)
    case addPhoto(picData: Data)
    case exploreAll
    case takepic
    case listMission
    case popOver
//    case detailView(place: PlaceModel)
}

final class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: Route){
        path.append(route)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func toRoot(){
        path = .init()
    }
}
