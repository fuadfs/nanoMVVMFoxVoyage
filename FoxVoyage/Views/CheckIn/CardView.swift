//
//  CardView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 25/07/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 227, height: 112)
                .foregroundColor(.white)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text("Mencoba makanan pak slamet cihuy")
                    .font(.custom("SFProText-Regular", size: 16))
                    .padding(.top, 20)
                Text("Tambahkan foto")
                    .font(.custom("SFProText-Regular", size: 12))
                    .foregroundColor(Color("Black400"))
                    .padding(.top, 5)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
