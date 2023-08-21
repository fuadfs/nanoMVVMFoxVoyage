//
//  AppDelegate.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 30/07/23.
//

import Foundation

import UIKit

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var pageToNavigationTo : String?
    @Published var isCheckedInToNavigationTo : Bool?
}

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        let options: UNAuthorizationOptions = [.badge, .sound, .alert]
          UNUserNotificationCenter.current()
            .requestAuthorization(options: options) { _, error in
              if let error = error {
                print("Error: \(error)")
              }
            }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      application.applicationIconBadgeNumber = 0
      UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
      UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("didreceive")
        
       let userInfo = response.notification.request.content.userInfo
        if let nama = userInfo["nama"] as? String {
            AppState.shared.pageToNavigationTo = nama
        }
        completionHandler()
        
        
        print("finich didreceive")
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("willPresent")

    }
}
