//
//  GalleryAccess.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 21/08/23.
//

import Foundation
import Photos

class GalleryAccess: ObservableObject {
    
    func requestGalleryAccess(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    // Gallery access granted
                    completion(true)
                case .denied, .restricted:
                    // Gallery access denied or restricted
                    completion(false)
                case .notDetermined:
                    // Shouldn't happen, but handle it anyway
                    completion(false)
                @unknown default:
                    // Handle any future cases (unlikely)
                    completion(false)
                }
            }
        }
    }
}
