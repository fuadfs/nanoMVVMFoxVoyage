//
//  UserProfileView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 26/07/23.
//

import SwiftUI

struct UserProfileView: View {
    @State private var currentTab: Int = 0
    @State private var currentNavBar: Int = 0
    private let categories = ["Memories", "Record"]
    
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading) {
                Profile ()
                
                VStack (alignment: .leading, spacing: 0) {
                    HStack {
                        ForEach(0...categories.count - 1, id:\.self) { i in
                            TabProfile (isActive: i == currentTab, text: categories[i])
                                .onTapGesture {
                                    currentTab = i
                                }
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.top)
                    Divider()
                }
                
                if currentTab == 0 {
                    ProfileMemoView()
                } else {
                    WeeklyView()
                    Spacer()
                }
                
            }
            .frame(maxHeight: .infinity)
            .ignoresSafeArea()
            
            HStack {
                BottomNavBar (image: Image(systemName: "magnifyingglass"), isSelected: currentNavBar == 0) {currentNavBar = 0}
                BottomNavBar (image: Image(systemName: "bookmark"), isSelected: currentNavBar == 1) {currentNavBar = 1}
                BottomNavBar (image: Image(systemName: "map"), isSelected: currentNavBar == 2) {currentNavBar = 2}
                BottomNavBar (image: Image(systemName: "person.crop.circle.fill"), isSelected: currentNavBar == 3) {currentNavBar = 3}
                
            }
            .frame(height: 50)
            .padding()
            .background(.white)
            .clipShape(Capsule())
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

struct Profile: View {
    var body: some View {
        ZStack {
            Image("ProfileBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 100)
            //                .frame(width: 300)
                .ignoresSafeArea()
            
            Circle()
                .frame(width: 180)
                .foregroundColor(Color("Redish400"))
                .opacity(0.1)
                .overlay(
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color("Redish400"))
                )
            
            Text("Jonison")
                .frame(height: 41)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft])
                .position(x: 120, y: 100)
            
        }
        .frame(maxHeight: 300)
        .background(.blue)
        .ignoresSafeArea()
    }
}

struct TabProfile: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            Text(text)
                .font(.custom("SFProText-Regular", size: 17))
                .foregroundColor(isActive ? Color("Redish400"): Color.black.opacity(0.4))
            
            if (isActive) {
                Color("Redish400")
                    .frame(width: 90, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing, 25)
    }
}

struct BottomNavBar: View {
    let image: Image
    let isSelected: Bool
    let action: ()-> Void

    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
                .foregroundColor(isSelected ? Color("Redish400") : Color(.gray))
                .font(.system(size: 25))
        })
    }
}
