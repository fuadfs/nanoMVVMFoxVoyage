//
//  MKCoordinateRegion+Extension.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 29/07/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.03121860), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    }
    
//    static func regionFromLandmark(_ landmark: Landmark) -> MKCoordinateRegion {
//        MKCoordinateRegion(center: landmark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
//    }
    
}
