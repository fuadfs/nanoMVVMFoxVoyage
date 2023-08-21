//
//  ContentView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI



struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    @StateObject var locationManager: LocationManager = .init()
    
    var body: some View {
        if showOnboarding {
            OnboardingView()

        }else{
            MainView()
        }
//        PlacedetailView(placeName: "String")
//        w()
//           WishlistVie
    }
    
            
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
