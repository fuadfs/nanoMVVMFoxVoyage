//
//  WishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 28/07/23.
//

import SwiftUI

struct WishlistcardView: View {
    let place: PlaceModel
    @State var isAddTowishList: Bool = false
    
    var body: some View{
        
        ZStack{
            Rectangle()
                .cornerRadius(30)
            //TASK : WARNA SESUAI TAG
                .foregroundColor(colorForTag(place.tag))
            
            VStack(alignment: .leading, spacing: 0){
                
                
                HStack{
                    VStack(alignment: .leading){
                        
                        
                        Text("\(place.name)􀰾")
                            .font(.custom("SFProDisplay-Medium", size: 28))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: 200, alignment: .leading)
                    //                    .background(.blue)
                    .padding(.leading, 9)
                    
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 0){
                        Spacer()
                        HStack(alignment: .top, spacing: 32){
                            VStack(alignment: .leading){
                                Text("Misi")
                                    .font(.custom("SFProText-Regular", size: 16))
                                    .foregroundColor(.white)
                                //TASK : JUMLAH MISI
                                Text("3")
                                    .font(.custom("SFProDisplay-Medium", size: 20))
                                    .foregroundColor(.white)
                            }
                            VStack(alignment: .leading){
                                Text("Jarak")
                                    .font(.custom("SFProText-Regular", size: 16))
                                    .foregroundColor(.white)
                                
                                //TASK : JARAK
                                Text("1.8 km")
                                    .font(.custom("SFProDisplay-Medium", size: 20))
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 16)
                        }
                    }
                    .padding(.trailing, 9)
                }
                .frame(height: 108)
                .padding(.top, 8)
                
            }
            .padding(.horizontal, 8)
        }
        .frame(width: 358, height: 82)
    }
    
    // Custom function to return color based on tag
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

struct WishlistcardView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistcardView(place: .example)
    }
}
