//
//  MainView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 30/07/23.
//

import SwiftUI

struct MainView: View {
    @State var index = 0
    var body: some View {
        ZStack(alignment: .bottom){
            switch (index){
            case 0:
                ExploreView()
            case 1:
                WishlistView()
            case 2:
                JourneyView()
            case 3:
                Text("provile")
            default:
                ExploreView()
            }
            
            
            customTabBar
                .padding(.bottom, 10)
                .padding(.horizontal, 16)
        }
        
    }
}

extension MainView{
    var customTabBar: some View {
        HStack{
            Spacer()
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(index == 0 ? Color("Redish400") : .white)
                .overlay{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 18))
                        .foregroundColor(index == 0 ? .white : Color("Black400"))
                }
                .onTapGesture {
                    index = 0
                }
            
            Spacer()
            
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(index == 1 ? Color("Redish400") : .white)
                .overlay{
                    Image(systemName: "bookmark")
                        .font(.system(size: 18))
                        .foregroundColor(index == 1 ? .white : Color("Black400"))
                }
                .onTapGesture {
                    index = 1
                }
            
            Spacer()
            
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(index == 2 ? Color("Redish400") : .white)
                .overlay{
                    Image(systemName: "map")
                        .font(.system(size: 18))
                        .foregroundColor(index == 2 ? .white : Color("Black400"))
                }
                .onTapGesture {
                    index = 2
                }
            
            Spacer()
            
            Circle()
                .frame(width: 56, height: 56)
                .foregroundColor(index == 3 ? Color("Redish400") : .white)
                .overlay{
                    Image(systemName: "person")
                        .font(.system(size: 18))
                        .foregroundColor(index == 3 ? .white : Color("Black400"))
                }
                .onTapGesture {
                    index = 3
                }
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(.white)
        .cornerRadius(999)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
