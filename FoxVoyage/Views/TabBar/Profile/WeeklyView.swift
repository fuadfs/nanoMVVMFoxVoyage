//
//  WeeklyView.swift
//  FoxVoyage
//
//  Created by Febrina Yusuf on 26/07/23.
//

import SwiftUI

struct WeeklyView: View {
    var body: some View {
        
        HStack {
            StatProfile (title: "Trip", statistic: 4, subtitle: "place")
            Spacer()
            StatProfile (title: "Stamps", statistic: 0, subtitle: "complete")
            
        }
        .padding()
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}

struct StatProfile: View {
    var title: String
    var statistic: Int
    var subtitle: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle ()
                .frame(width: 170, height: 150)
                .foregroundColor(Color("Green200"))
                .cornerRadius(30)
            
            VStack (alignment: .leading) {
                Text (title)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .padding(.bottom)
                
                Text ("\(statistic)")
                    .fontWeight(.semibold)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                
                Text (subtitle)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
            }
            .padding()
        }
    }
}
