//
//  PopovercardView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 29/07/23.
//

import SwiftUI

struct PopovercardView: View {
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack (spacing: 10){
                Image("postcard")
                
                Text("Congratulations")
                    .font(.custom("SFProText-Regular", size: 21))
            }.padding(.vertical, 40)
                .padding(.leading, 20)
                
            
            
            //TASK: MASUKIN SESUAI POSTCARD YG DIA DAPET
            MissionCardView(place: .example)
                .padding(.bottom, 30)
            
            HStack{
                Text("To")
                    .font(.custom("SFProText-Regular", size: 20))
                //TASK: SESUAIKAN DENGAN NAMA USER
                Text("Emiliy")
                    .font(.custom("SFProText-Regular", size: 20))
               
            }
            Rectangle()
                .frame(width: 358, height: 1)
                .foregroundColor(Color("Black400"))
            
            HStack{
                Text("Congratulations on completing the mission")
                    .font(.custom("SFProText-Regular", size: 20))
                
    
            }
            Rectangle()
                .frame(width: 358, height: 1)
                .foregroundColor(Color("Black400"))
            
            HStack{
                Text("and crafting beautiful memories in this place!")
                    .font(.custom("SFProText-Regular", size: 20))
                
            }
            Rectangle()
                .frame(width: 358, height: 1)
                .foregroundColor(Color("Black400"))
            
            Spacer()
            Button(action: {}, label: {
                ZStack{
                    Rectangle()
                        .frame(width: 358, height: 64)
                        .cornerRadius(999)
                        .foregroundColor(Color("Redish400"))
                    
                    Text("Share Stamp")
                        .font(.custom("SFProText-Medium", size: 17))
                        .foregroundColor(.white)
                }
                
               
            })
            
        }.padding(.horizontal, 16)
    }
}

struct PopovercardView_Previews: PreviewProvider {
    static var previews: some View {
        PopovercardView()
    }
}
