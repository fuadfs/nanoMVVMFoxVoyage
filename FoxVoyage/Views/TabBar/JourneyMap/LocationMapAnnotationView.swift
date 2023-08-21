//
//  LocationMapAnnotationView.swift
//  CheckLocation
//
//  Created by Fuad Fadlila Surenggana on 25/07/23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0){
//            Image (systemName: "map.circle.fill")
            Image("sun")
                .resizable ()
                .scaledToFit ()
                .frame (width: 30, height: 30) .font (.headline)
//                .foregroundColor (.white)
                .padding (6)
//                .background (accentColor)
                .cornerRadius (36)
            
            Image (systemName: "triangle.fill")
                .resizable()
                .scaledToFit ()
//                .foregroundColor (accentColor)
                .frame (width: 10, height: 10)
                .rotationEffect (Angle(degrees: 180))
                .offset (y: -3)
                .padding (.bottom, 40)
        }
//        .background(.blue)
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
