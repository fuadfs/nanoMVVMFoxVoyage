//
//  FoxVoyageApp.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 20/07/23.
//

import SwiftUI

@main
struct FoxVoyageApp: App {
    
    @AppStorage("savePlacesToCoreData") var savePlacesToCoreData: Bool = true
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    @StateObject var informationViewModel = InformationViewModel()
    @StateObject var router = Router()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    func saveToCoreDataForFirstTime(){
        if savePlacesToCoreData{
            do{
                let placemodels = try JSONManager.sharedInstance.loadData(path: "place", type: PlaceModel.self)
                
                for place in placemodels {
                    CoreDataController.sharedInstance.savePlaceModel(place)
                }
                savePlacesToCoreData = false
                print(placemodels)
            }catch{
                print(error.localizedDescription)
            }
            return
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path){
                ContentView()
                    .navigationDestination(for: Int.self){ number in
                        Text("number \(number)")
                    }
                    .navigationDestination(for: Route.self) { route in
                        switch(route){
                        case .explore:
                            ExploreView()
                        case .onboarding:
                            OnboardingView()
                        case .galleryAccess:
                            GalleryAccessView(galleryAcces: GalleryAccess())
                        case .infoLocation:
                            InformationLocationView()
                        case .infoLocationSearch(let locationManager):
                            InformationLocationSearchView(locationManager: locationManager)
                        case .addPhoto(let picData):
                            AddNoteToPhotoView(picData: picData)
//                        case .detailView(let place):
//                            PlacedetailView(place: place)
                        case .exploreAll:
                            ExploreallView()
                        case .takepic:
                            AddphotoView()
                        case .listMission :
                            PlacedetailView(placeName: "Kampung Terih")
                        case .popOver:
                            PopoverView()
                        }
                    }
            }
            .environmentObject(router)
            .environmentObject(informationViewModel)
            .onAppear{
                saveToCoreDataForFirstTime()
            }
        }
    }
}
