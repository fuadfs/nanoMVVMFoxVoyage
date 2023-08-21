//
//  MapViewHelper.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 21/08/23.
//

import SwiftUI
import MapKit

struct MapViewHelper: UIViewRepresentable{
    @EnvironmentObject var locationManager: LocationManager
    func makeUIView(context: Context) -> MKMapView {
        return locationManager.mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
}
