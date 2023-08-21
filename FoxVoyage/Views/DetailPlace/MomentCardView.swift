//
//  MomentCardView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 27/07/23.
//

import SwiftUI

struct MomentCardView: View {
    let moment: Moments
    
    var body: some View {
        VStack(alignment: .leading){
            Text(moment.date)
                .font(Font.custom("SF Pro Text", size: 16))
                .foregroundColor(Color(red: 0.58, green: 0.59, blue: 0.63))
            VStack(alignment: .leading){
                HStack(spacing: 0){
                    Image(moment.firstImage)
                    Image(moment.secondImage)
                }
                Text("Moment Captured")
                    .font(Font.custom("SF Pro Text", size: 14.92737))
                    .padding(.leading)
                
                Text("\(moment.momentCount)")
                
                    .font(
                        Font.custom("SF Pro Display", size: 18.65922)
                            .weight(.medium))
                    .padding(.leading)
                    .padding(.vertical,1)
                
                
                
            }
            .padding(.horizontal, 7.46369)
            .padding(.top, 7.46369)
            .padding(.bottom, 14.92737)
            .background(Color(red: 1, green: 0.98, blue: 0.95))
            .cornerRadius(30)
        }
    }
}

struct MomentCardView_Previews: PreviewProvider {
    static var previews: some View {
        MomentCardView(moment: momentList[1])
            .previewLayout(.sizeThatFits)
    }
}
