//
//  LocationManager.swift
//  CheckLocation
//
//  Created by Fuad Fadlila Surenggana on 18/07/23.
//

import SwiftUI
import CoreLocation
import MapKit
// MARK: Combine Framework to watch Textfield Change
import Combine

class AlertSettings: ObservableObject {
    @Published var showAlert = false
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate{
    // MARK: Properties
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    
    // MARK: Search Bar Text
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    @Published var fetchedPlaces: [CLPlacemark]?
    
    // MARK: User Location
    @Published var userLocation: CLLocation?
    
    // MARK: Final Location
    @Published var pickedLocation: CLLocation?
    @Published var pickedPlaceMark: CLPlacemark?
    
    @Published var region : MKCoordinateRegion = .init()
//    @Published var region = MKCoordinateRegion.defaultRegion()
    
    @State var places: [PlaceModel] = []
    
    @Published var placeToCheckIn: String = ""
    @Published var isCheckedIn: Bool = false
    
    
    
    
    var locationCoordinatesArray: [CLLocationCoordinate2D]  = []
    var identifiersArray: [String] = []
    
    var settings = AlertSettings()
    
    override init(){
        super.init()
        // MARK: Setting Delegates
        manager.delegate = self
        mapView.delegate = self
        
        // MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.requestLocation()
        
        // MARK: Search Textfield Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                if value != ""{
                    self.fetchPlaces(value: value)
                }else{
                    self.fetchedPlaces = nil
                }
            })
    }
    
    func fetchPlaces(value: String){
        // MARK: Fetching places using MKLocalSearch & Asyc/Await
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                
                let response = try await MKLocalSearch(request: request).start()
                // We can also Use Mainactor To publish changes in Main Thread
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> CLPlacemark? in
                        return item.placemark
                    })
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // MARK: Location Authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
            case .authorizedAlways: manager.requestLocation()
            case .authorizedWhenInUse: manager.requestLocation()
            case .denied: handleLocationError()
            case .notDetermined: manager.requestWhenInUseAuthorization()
            default: ()
        }
    }
    
    func handleLocationError(){
        print("access denied")
    }
    
    // MARK: Add Draggable Pin to MapView
    func addDraggablePin(coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
//        annotation.title = "Food will be delivered here"
        
        mapView.addAnnotation(annotation)
    }
    
    // MARK: Enabling Dragging
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "DELIVERYPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else{return}
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
        updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.longitude))
    }
    
    func updatePlacemark(location: CLLocation){
        Task{
            do{
                guard let place = try await reverseLocationCoordinates(location: location) else{return}
                await MainActor.run(body: {
                    self.pickedPlaceMark = place
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    // MARK: Displaying New Location Data
    func reverseLocationCoordinates(location: CLLocation)async throws->CLPlacemark?{
        let place = try await CLGeocoder().reverseGeocodeLocation(location).first
        return place
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
//        print("[didUpdateLocations][Location]\(location.coordinate)")
        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        self.userLocation = location
        
        fetchedDataLocation()
//        Task {
//            await readFileJSONdata()
//        }
        
    }
    
    func fetchedDataLocation() {
//        places = CoreDataController.sharedInstance.fetchPlaceModels()
        print(" fetchedDataLocation jalan")
        locationCoordinatesArray =
        [CLLocationCoordinate2D(latitude: 1.1924597737473719, longitude: 104.08920451777048), CLLocationCoordinate2D(latitude: 1.156321233032294, longitude: 104.08426367123171), CLLocationCoordinate2D(latitude: 1.118394, longitude: 103.952007), CLLocationCoordinate2D(latitude: 1.123827, longitude: 103.935072), CLLocationCoordinate2D(latitude: 1.1273917960632145, longitude: 103.92923507769095), CLLocationCoordinate2D(latitude: 1.11883, longitude: 103.954134), CLLocationCoordinate2D(latitude: 1.145068, longitude: 103.948013), CLLocationCoordinate2D(latitude: 1.122202, longitude: 104.054331), CLLocationCoordinate2D(latitude: 1.150647, longitude: 104.050455), CLLocationCoordinate2D(latitude: 1.1629277932466477, longitude: 104.04598854579676), CLLocationCoordinate2D(latitude: 1.162062, longitude: 104.041073), CLLocationCoordinate2D(latitude: 1.17331, longitude: 104.070875), CLLocationCoordinate2D(latitude: 1.170018, longitude: 104.081643), CLLocationCoordinate2D(latitude: 5.195169, longitude: 97.075943), CLLocationCoordinate2D(latitude: 1.0875467227428972, longitude: 103.94280425832288), CLLocationCoordinate2D(latitude: 1.085002, longitude: 103.97251), CLLocationCoordinate2D(latitude: 1.0842931200610917, longitude: 103.94953845606284), CLLocationCoordinate2D(latitude: 0.939987336901875, longitude: 104.06481815287042), CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
         CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
         CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
         CLLocationCoordinate2D(latitude: 1.188364, longitude: 104.077354), CLLocationCoordinate2D(latitude: 1.1893046882057359, longitude: 104.11062956451119), CLLocationCoordinate2D(latitude: 1.204200095156528, longitude: 104.07715651425261), CLLocationCoordinate2D(latitude: 1.1713605081427432, longitude: 104.06996421153927), CLLocationCoordinate2D(latitude: 1.14246, longitude: 104.147489), CLLocationCoordinate2D(latitude: 1.1489806090070427, longitude: 104.14075445795682), CLLocationCoordinate2D(latitude: 1.146395, longitude: 104.141837), CLLocationCoordinate2D(latitude: 1.145179, longitude: 104.143144), CLLocationCoordinate2D(latitude: 1.1444940650400677, longitude: 104.14435736424663), CLLocationCoordinate2D(latitude: 1.1912065336750406, longitude: 104.0836251155722), CLLocationCoordinate2D(latitude: 1.0888, longitude: 104.135199), CLLocationCoordinate2D(latitude: 1.1477308735911975, longitude: 104.1421067365945), CLLocationCoordinate2D(latitude: 0.8591841215307142, longitude: 104.1459034939578), CLLocationCoordinate2D(latitude: 0.7567330153332622, longitude: 104.18607202715529), CLLocationCoordinate2D(latitude: 0.583485, longitude: 104.197831), CLLocationCoordinate2D(latitude: 0.773336, longitude: 104.173366), CLLocationCoordinate2D(latitude: 0.7513682552872534, longitude: 104.19068602606477), CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
         CLLocationCoordinate2D(latitude: 0.6248673884725112, longitude: 104.28490267905522), CLLocationCoordinate2D(latitude: 0.6428505942500103, longitude: 104.28807360083346), CLLocationCoordinate2D(latitude: 0.6507126168604905, longitude: 104.28419913674782), CLLocationCoordinate2D(latitude: 1.1484703512166674, longitude: 103.89148321451437), CLLocationCoordinate2D(latitude: 1.1442266595056825, longitude: 103.92339979662295), CLLocationCoordinate2D(latitude: 0.9837221996045635, longitude: 104.09980881538735), CLLocationCoordinate2D(latitude: 1.152839, longitude: 104.056425)
        ]
        
        identifiersArray = ["Nuvasa Bay",
                            "Kampung Terih",
                            "Tebing Langit",
                            "Taman Rusa",
                            "Taman Kolam",
                            "Batam Forest Top",
                            "Tangga Seribu",
                            "Welcome To Batam",
                            "Coastarina",
                            "Dino\'s Gate",
                            "Miniatur House Indonesia",
                            "MAngrove Pandang Tak Jemu",
                            "Kebun Raya Batam",
                            "Agro Wisata Buah NAga",
                            "Agro Wisata Jambu MArina",
                            "Hutan Wisata Mata Kucing",
                            "Kampung Sawah by Jambu Madu Edufarm",
                            "Agro Mulyo Eco Adventures",
                            "Panbil Nature Reserve",
                            "Tanjung Memban",
                            "Pantai Melayu",
                            "Pantai Nongsa",
                            "Teluk Mata Ikan",
                            "Pulau Putri Nongsa",
                            "Pantai Bale-Bale",
                            "Sekilak",
                            "Pantai Lagorap",
                            "Pantai Ketapang",
                            "Pantai Boneta",
                            "Pantai Tanda Pesona",
                            "Nuvasa Bay",
                            "Pantai Panau",
                            "Pantai Payung",
                            "Pantai Melayu Barelang",
                            "Pantai Melur Barelang",
                            "Pulau Abang",
                            "Pantai Mirota",
                            "Pantai Vio-Vio",
                            "Pantai Dendang Melayu",
                            "Pantai Elyora",
                            "Tegar Bahari",
                            "Reviola",
                            "Pantai Pasir Putih",
                            "Pantai Tanjung Pinggir",
                            "Pantai Tanjung Piayu",
                            "Mega Wisata Ocarina"]
        
        monitorRegionsAtLocations(locations: locationCoordinatesArray, identifiers: identifiersArray)
    }
    
    
    func monitorRegionsAtLocations(locations: [CLLocationCoordinate2D], identifiers: [String]) {
        // Make sure the device supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            //            let maxDistance = manager.maximumRegionMonitoringDistance
            let maxDistance = 50
            // For the sake of this tutorial, we will use the maximum allowed distance.
            // When you are going production, it is recommended to optimize this value according to your needs to be less resource-intensive.
            
            for (index, coordinate) in locations.enumerated() {
                let identifier = identifiers[index]
                // Register the region.
                let region = CLCircularRegion(center: coordinate, radius: CLLocationDistance(maxDistance), identifier: identifier)
                region.notifyOnEntry = true
                region.notifyOnExit = true
                
                //                manager.startMonitoringVisits()
                manager.startMonitoring(for: region)
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        var getPlace = CoreDataController.sharedInstance.fetchGetPlace(location: region.identifier)
        
        print(getPlace.count)
        
        settings.showAlert = true
        
        if UIApplication.shared.applicationState == .active {
            
        } else {
            
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                //            print("Dispatch")
                
                //        }
                manager.startMonitoringVisits()
                //            print("You arrived at \(region.identifier)")
                print("You arrived at \(getPlace[0].name)")
                //            let body = "You arrived at " + region.identifier
                let title = "You are in " + getPlace[0].name
                let body = "This seems a nice place, want to capture a moment here? 🦊"
                let notificationContent = UNMutableNotificationContent()
                notificationContent.title = title
                notificationContent.body = body
                notificationContent.sound = .default
                notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
                notificationContent.userInfo = ["name": getPlace[0].name]
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(
                    identifier: "location_change",
                    content: notificationContent,
                    trigger: trigger)
                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error: \(error)")
                    }
                }
                
                self.placeToCheckIn = region.identifier
                self.isCheckedIn = true
//            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
            settings.showAlert = false
    
            if UIApplication.shared.applicationState == .active {
    
            } else {
                print("You left \(region.identifier)")
//              let body = "You left " + region.identifier
//              let notificationContent = UNMutableNotificationContent()
//              notificationContent.body = body
//              notificationContent.sound = .default
//              notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
//              let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
//              let request = UNNotificationRequest(
//                identifier: "location_change",
//                content: notificationContent,
//                trigger: trigger)
//              UNUserNotificationCenter.current().add(request) { error in
//                if let error = error {
//                  print("Error: \(error)")
//                }
//              }
                self.placeToCheckIn = "No Where"
                self.isCheckedIn = false
            }
        }
}

