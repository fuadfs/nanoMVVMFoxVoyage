//
//  PopularPlaceCard.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 27/07/23.
//

import SwiftUI


struct PopularPlaceCard : View{
    
    let place: PlaceModel
    @State var isAddTowishList: Bool = false
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 171, height: 226)
                .cornerRadius(30)
                .foregroundColor(Color("Redish100"))
            
            VStack{
                Button(action:{
                    isAddTowishList.toggle()
                }){
                    ZStack{
                        Image(place.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 155, height: 136)
                            .cornerRadius(30)
                            .padding(.top, -30)
                        ZStack{
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(.white)
                            
                            Image(systemName: isAddTowishList ? "bookmark" : "bookmark.fill")
                                .foregroundColor( isAddTowishList ? .black : Color("Redish400"))
                        }.padding(.bottom, 100)
                            .padding(.leading, 90)

                            
                    }
                    
                }
                //TASK: NAMA TEMPAT --> maksimal jadi 2 line
                Text("\(place.name)􀰾")
                    .font(.custom("SFProDisplay-Regular", size: 20))
                    .padding(.leading, -30)
            }
            
        }
    }
}



struct PopularPlaceCard_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlaceCard(place: .example)
    }
}

