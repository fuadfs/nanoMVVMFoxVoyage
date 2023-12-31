//
//  locAccess.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 21/07/23.
//

import SwiftUI
import CoreLocation

struct locationAccessView: View {
    @EnvironmentObject var router: Router
    @State private var locationPermissionStatus: CLAuthorizationStatus = .notDetermined
    @StateObject var locationManager: LocationManager = .init()
    
    var body: some View {
        VStack{
            VStack {
                Text("Discover ")
                    .foregroundColor(Color("Black200"))
                + Text("premier navigation, authorize location access ")
            }
            .font(.largeTitle)
            .frame(maxWidth: 355, alignment: .leading)

            Image("locAccess")
                .padding(.top, 30.0)
            
            Text("Embrace our company on your voyage, as we unveil wonders around, granting access to locations abound. ")
                .font(.body)
                .frame(maxWidth: 355, alignment: .leading)
                .padding(.top)
            
            Spacer()
            
            VStack{
                Button("Give Access"){
                    locationManager.manager.requestLocation()
                    router.push(.galleryAccess)
                }
                .buttonStyle(ButtonOnBoardScreen())
            }
        }
    }
}

struct locAccess_Previews: PreviewProvider {
    static var previews: some View {
        locationAccessView()
    }
}
