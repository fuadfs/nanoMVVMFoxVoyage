//
//  JourneyView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 25/07/23.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let systemImageName: String
    var isActive: Bool
}


struct JourneyView: View {
    @State private var activeTabIndex = 0

    private let tabItems: [TabItem] = [
        TabItem(systemImageName: "map.fill", isActive: true),
        TabItem(systemImageName: "bookmark", isActive: false),
        TabItem(systemImageName: "rectangle.dashed.and.paperclip", isActive: false),
        TabItem(systemImageName: "person", isActive: false)
    ]

    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 175, height: 56)
                        .cornerRadius(999)
                        .foregroundColor(.white)

                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color("Green200"))
                        .padding(.trailing, 123)
                        .padding(.leading, 4)

                    Image(systemName: "rectangle.dashed.and.paperclip")
                        .padding(.trailing, 123)
                        .padding(.leading, 4)

                    Text("4")
                        .font(.custom("SFProDisplay-Medium", size: 20))
                        .padding(.leading, 25)
                }

                ZStack{
                    Rectangle()
                        .frame(width: 175, height: 56)
                        .cornerRadius(999)
                        .foregroundColor(.white)

                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color("Green200"))
                        .padding(.trailing, 123)
                        .padding(.leading, 4)

                    Image(systemName: "rectangle.dashed.and.paperclip")
                        .padding(.trailing, 123)
                        .padding(.leading, 4)

                    Text("4")
                        .font(.custom("SFProDisplay-Medium", size: 20))
                        .padding(.leading, 25)
                }
            }





        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Map")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
        )
    }
}

struct JourneyView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyView()
    }
}
