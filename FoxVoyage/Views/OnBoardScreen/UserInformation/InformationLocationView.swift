//
//  InformationLocationView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 23/07/23.
//

import SwiftUI

struct InformationLocationView: View {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    @StateObject var locationManager: LocationManager = .init()
    @EnvironmentObject var viewModel : InformationViewModel
    @EnvironmentObject var router : Router
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var scheme

    var body: some View {
        VStack{
            VStack{
                Text("Hi, \(viewModel.name)")
                    .foregroundColor(Color("Black200"))
                Text("where do you reside?")
            }
            .font(.largeTitle)
            .frame(maxWidth: 355, alignment: .leading)
            
            Button{
                // MARK: Navigating To MapView
                router.push(.infoLocationSearch(locationManager: locationManager))
            } label: {
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    if locationManager.pickedPlaceMark != nil{
                        VStack(alignment: .leading) {
                            Text(locationManager.pickedPlaceMark?.name ?? "")
                                .font(.title3.bold())
                            
                            Text(locationManager.pickedPlaceMark?.locality ?? "")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    } else {
                        Text("home address")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.trailing, 12.0)
                            .frame(maxWidth: 250, alignment: .leading)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 0)
                .frame(width: 358, height: 56, alignment: .leading)
                .cornerRadius(999)
                .overlay(
                    RoundedRectangle(cornerRadius: 999)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.82, green: 0.83, blue: 0.85), lineWidth: 1)
                )
            }
            
            Spacer()
            
            Button{
                viewModel.saveUserData(longitude: locationManager.pickedPlaceMark?.location?.coordinate.longitude ?? 0.0, latitude: locationManager.pickedPlaceMark?.location?.coordinate.latitude ?? 0.0)
                showOnboarding = false
                router.toRoot()
            }label:{
                HStack{
                    Text("Next")
                        .font(.body)
                        .foregroundColor(.white)
                    Image(systemName: "arrow.up.forward")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 358, maxHeight: 64)
                .background(Color("Redish400"))
                .cornerRadius(50)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
