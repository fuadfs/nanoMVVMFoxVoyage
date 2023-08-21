//
//  InformationLocationSearchView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 26/07/23.
//

import SwiftUI
import MapKit

struct InformationLocationSearchView: View {
    @ObservedObject var locationManager: LocationManager
    @State var searchText = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    
                TextField("home adress", text: $locationManager.searchText)
                    .font(.body)
                    .padding(.trailing, 12.0)
                    .frame(maxWidth: 250, alignment: .leading)
                    .foregroundColor(Color("Redish400"))
                
                Image(systemName: "multiply")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 0)
            .frame(width: 358, height: 56, alignment: .leading)
            .cornerRadius(999)
            .overlay(
                
            RoundedRectangle(cornerRadius: 999)
            .inset(by: 0.5)
            .stroke(Color("Redish400"), lineWidth: 1))
            .padding(.bottom)
            .padding(.top)
            
            if let places = locationManager.fetchedPlaces,!places.isEmpty{
                List{
                    ForEach(places,id: \.self){place in
                        Button {
                            if let coordinate = place.location?.coordinate{
                                locationManager.pickedLocation = .init(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                                locationManager.addDraggablePin(coordinate: coordinate)
                                locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                            }
                            
                        } label: {
                            HStack(alignment: .center, spacing: 16){
                                ZStack{
                                    Image("ellipse")
                                    Image(systemName: "square.dashed")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                }
                                
                                VStack(alignment: .leading, spacing: 4){
                                    Text(place.name ?? "")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                                    Text(place.locality ?? "")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(red: 0.77, green: 0.35, blue: 0.23))
                                }
                            }
                            .padding(12)
                            .frame(width: 358, alignment: .leading)
                            .background(Color(red: 1, green: 0.98, blue: 0.95))
                            .cornerRadius(30)
                        }
                    }
                }
                .listStyle(.plain)
            }
            else{
                // MARK: Live Location Button
                Button {
                    // MARK: Setting Map Region
                    if let coordinate = locationManager.userLocation?.coordinate{
                        locationManager.mapView.region = .init(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                        locationManager.addDraggablePin(coordinate: coordinate)
                        locationManager.updatePlacemark(location: .init(latitude: coordinate.latitude, longitude: coordinate.longitude))
                    }
                } label: {
                    Label {
                        Text("Use Current Location")
                            .font(.callout)
                    } icon: {
                        Image(systemName: "location.north.circle.fill")
                    }
                    .foregroundColor(.green)
                }
            }

            Spacer()
        }
        
        MapViewHelper()
            .environmentObject(locationManager)
            .ignoresSafeArea()
        
        // MARK: Displaying Data
        if let place = locationManager.pickedPlaceMark{
            VStack(){
                HStack(spacing: 15){
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text(place.name ?? "")
                            .font(.title3.bold())
                        
                        Text(place.locality ?? "")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .frame(alignment: .leading)
                
                Button {
                    dismiss()
                } label: {
                    Text("Confirm Location")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,12)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.green)
                        }
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 3)
            .padding(.horizontal)
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(scheme == .dark ? .black : .white)
                    .ignoresSafeArea()
            }
            .frame(alignment: .bottom)
        }
    }
}

struct InformationLocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        InformationLocationSearchView(locationManager: LocationManager())
            
    }
}
