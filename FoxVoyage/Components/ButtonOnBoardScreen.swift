//
//  ButtonOnBoardScreen.swift
//  FoxVoyage
//
//  Created by Fuad Fadlila Surenggana on 21/08/23.
//

import SwiftUI

struct ButtonOnBoardScreen: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: 358, maxHeight: 64)
            .background(Color("Redish400"))
            .cornerRadius(999)
        
    }
}
