//
//  PlaceModel.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import Foundation

struct PlaceModel: Decodable, Identifiable {
    let id: UUID
    let longitude: String
    let latitude: String
    let name: String
    let tag: String
    let address: String
    let district: String
    let operationalHour: String
    let desc: String
    var isCheckin: Bool = false
    var isAddedToWishList: Bool =  false
    var activities: [ActivityModel] = []
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case longitude = "Longitude"
        case latitude = "Latitude"
        case name = "Nama"
        case tag = "Class"
        case address = "Address"
        case district = "Disctrict"
        case operationalHour = "Operational Hour"
        case desc = "Desc."
        case activities = "Activity"
        case image = "image"
    }
    
    init(id: UUID, longitude: String, latitude: String, name: String, tag: String, address: String, district: String, operationalHour: String, desc: String, activities: [ActivityModel] = [], image: String) {
            self.id = id ?? UUID()
            self.longitude = longitude
            self.latitude = latitude
            self.name = name
            self.tag = tag
            self.address = address
            self.district = district
            self.operationalHour = operationalHour
            self.desc = desc
            self.activities = activities
            self.image = image
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.longitude = try container.decode(String.self, forKey: .longitude)
        self.latitude = try container.decode(String.self, forKey: .latitude)
        self.name = try container.decode(String.self, forKey: .name)
        self.tag = try container.decode(String.self, forKey: .tag)
        self.address = try container.decode(String.self, forKey: .address)
        self.district = try container.decode(String.self, forKey: .district)
        self.operationalHour = try container.decode(String.self, forKey: .operationalHour)
        self.desc = try container.decode(String.self, forKey: .desc)
        let activitiesText = try container.decode(String.self, forKey: .activities)
        self.activities = PlaceModel.decodeActivities(from: activitiesText)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
    static func decodeActivities(from text: String) -> [ActivityModel] {
        var activities: [ActivityModel] = []
        let activityLines = text.components(separatedBy: "\n")
        
        for line in activityLines {
            if !line.isEmpty {
                let components = line.components(separatedBy: ": ")
                if components.count == 2 {
                    let titleWithIndex = components[0]
                    let title = titleWithIndex.components(separatedBy: ". ")
                    
                    let description = components[1]
                    if title.count == 2 {
                        let activity = ActivityModel(title: title[1], desc: description)
                        activities.append(activity)
                    }else{
                        let activity = ActivityModel(title: title.first ?? "", desc: description)
                        activities.append(activity)
                    }
                }
            }
        }
        
        return activities
    }
}

extension PlaceModel{
    static let example = PlaceModel(id: UUID(), longitude: "1020314", latitude: "1.2012310", name: "Test Place", tag: "Atraksi", address: "Nongsa", district: "Batu Besar", operationalHour: "09.00 - 21.00", desc: "deskripsi disini", image: "0")
}


struct ActivityModel{
    let title: String
    let desc: String
}

