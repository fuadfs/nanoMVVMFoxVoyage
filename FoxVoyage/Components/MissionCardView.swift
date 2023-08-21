//
//  MissionCardView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 28/07/23.
//

import SwiftUI

struct MissionCardView: View {
    
    let place: PlaceModel
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
            //TASK : WARNA SESUAI TAG
                .foregroundColor(colorForTag(place.tag))
            
            HStack (spacing: 110){
                
                VStack (alignment: .leading){
                    
                    //TASK : GANTI DENGAN LOGO APP
                    Image("logo")
                    
                    Spacer()
                    
                    Text("Place")
                        .font(.custom("SFProDisplay-Regular", size: 9))
                        .foregroundColor(.white)
                    
                    //TASK: NAMA TEMPAT
                    Text("Taman Rusa")
                        .font(.custom("SFProDisplay-Regular", size: 13))
                        .foregroundColor(.white)
                    Spacer()
                    Text("Date")
                        .font(.custom("SFProDisplay-Regular", size: 9))
                        .foregroundColor(.white)
                    //TASK : DATE
                    Text("FRI 21 JULY")
                        .font(.custom("SFProDisplay-Regular", size: 13))
                        .foregroundColor(.white)
                    
                    
                    
                }.padding(.vertical, 28)
                    
                
                //TASK: SESUAIKAN GAMBAR DENGAN MISSION
                Image("missioncard")
                    
                
            }
        }
        .frame(width: 358, height: 284)
        
    }
    
    func colorForTag(_ tag: String) -> Color {
        switch tag.lowercased() {
        case "beach":
            return Color("Red100")
        case "park":
            return Color("Yellow200")
        case "artificial attraction":
            return Color("Violet100")
        case "natural attraction":
            return Color("Green200")
        default:
            return Color.gray
        }
    }
    
}

struct MissionCardView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCardView(place: .example)
    }
}
