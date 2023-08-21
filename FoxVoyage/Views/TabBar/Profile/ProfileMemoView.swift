//
//  ProfileMemoView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 27/07/23.
//

import SwiftUI

struct ProfileMemoView: View {
    
    var body: some View {
        
        ScrollView {
            VStack {
                MemoCardView (title: "Nuvasa Bay", month: "July", moments: "Moments", image: "exampleimage", date: 21, totMoments: 2)
                MemoCardView (title: "Pantai Nongsa", month: "July", moments: "Moments", image: "exampleimage", date: 31, totMoments: 1)
                
            }
            .padding(.all)
        }
        
    }
}

struct ProfileMemoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMemoView()
    }
}

struct MemoCardView: View {
    var title: String
    var month: String
    var moments: String
    var image: String
    var date: Int
    var totMoments: Int
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.4)
                .frame(width: 358, height: 263)
                .background(
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 358, height: 263)
                        .clipped()
                )
                .cornerRadius(30)
            
            HStack {
                Text(title)
                    .font(
                        Font.custom("SF Pro Display", size: 22)
                            .weight(.medium)
                    )
                    .kerning(0.35)
                    .foregroundColor(.white)
                
                    .padding()
                
                VStack (alignment: .leading) {
                    Text(month)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .padding(.bottom, 5)
                    
                    Text("\(date)")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                .padding()
                
                VStack (alignment: .leading) {
                    Text(moments)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .padding(.bottom, 5)
                    
                    Text("\(totMoments)")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                .padding()
            }
            .padding(.top, 180)
            .padding(.leading, 5)
        }
    }
}
