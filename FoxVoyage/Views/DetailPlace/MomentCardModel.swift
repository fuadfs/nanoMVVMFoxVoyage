//
//  MomentCardModel.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 27/07/23.
//

import Foundation

struct Moments {
    let date: String
    let firstImage: String
    let secondImage: String
    let momentCount: Int
    
}

var momentList:[Moments] = [
    Moments(date: "Wednesday, 23 Nov 07:16 AM", firstImage: "place1", secondImage: "place2", momentCount: 3),
    Moments(date: "Wednesday, 23 Nov 07:16 AM", firstImage: "place1", secondImage: "place2", momentCount: 4)
]


