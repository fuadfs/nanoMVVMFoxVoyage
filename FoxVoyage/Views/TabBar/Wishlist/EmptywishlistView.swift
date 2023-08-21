//
//  EmptywishlistView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 23/07/23.
//

import SwiftUI

struct EmptywishlistView: View {
    var body: some View {
        VStack{
            
            //user
            HStack{
                Text("Hi,")
                    .font(.custom("SFProDisplay-Regular", size: 20))
                    .foregroundColor(Color("Black600"))
                
                Text("Kelly")
                    .font(.custom("SFProDisplay-Regular", size: 20))
                    .foregroundColor(Color("Redish400"))
            }.padding(.trailing, 290)
            
                
            
            Text("Looks like you haven't crafted your fantastic \ntravel plan yet!")
                .font(.custom("SFProDisplay-Regular", size: 34))
                .foregroundColor(Color("Black900"))
                .padding(.trailing, 50)
            
            
            //imagestate
            Image("emptystate")
                .frame(width: 239, height: 190)
                .padding(.bottom, 32)
                .padding(.top, 128)
            Text("Your wishlist is yearning for an exhilarating tale")
                .font(.custom("SFProText-Regular", size: 17))
                .foregroundColor(Color("Black600"))
            Text("so start planning your next adventure now!")
                .font(.custom("SFProText-Regular", size: 17))
                .foregroundColor(Color("Black600"))
            
            Button(action: {}, label: {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 999)
                        .fill(Color("Redish100"))
                        .frame(width: 358, height: 64)
                    
                    RoundedRectangle(cornerRadius: 999)
                        .stroke(Color("Redish400"), lineWidth: 2)
                        .frame(width: 358, height: 64)
                    
                    HStack{
                        Text("Add place")
                            .font(.custom("SFProText-Medium", size: 17))
                            .foregroundColor(Color("Black900"))
                        Image(systemName: "arrow.up.right")
                            .font(.custom("SFProText-Medium", size: 17))
                            .foregroundColor(Color("Black900"))
                    }

                    
                }
               
                    
             
            })
            
            Spacer()
            
            //tabview
            ZStack{
                Rectangle()
                    .frame(width: 359, height: 72)
                    .cornerRadius(999)
                    .foregroundColor(.white)
                
                HStack (spacing: 62){
                    ZStack{
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundColor(Color("Redish400"))
                        
                        Image(systemName: "map.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                    Image(systemName: "person")
                        .font(.system(size: 18))
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Redish100"))
    }
}

struct EmptywishlistView_Previews: PreviewProvider {
    static var previews: some View {
        EmptywishlistView()
    }
}
