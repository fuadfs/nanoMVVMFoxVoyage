//
//  AddnotetophotoView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 30/07/23.
//

import SwiftUI

struct AddNoteToPhotoView: View {
    @EnvironmentObject var router: Router
    
    let picData: Data
    @State private var textInput: String = ""
    @State private var textColor: Color = Color("Black400")
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            ZStack(alignment: .bottom){
                if picData == nil{
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .ignoresSafeArea()
                }else{
                    Image(uiImage: UIImage(data: picData)!)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                VStack{
                    HStack{
                        Spacer()
                        Circle().fill(.white)
                            .frame(width: 48, height: 48)
                            .overlay {
                                Image(systemName: "xmark")
                            }
                            .padding(.horizontal, 16)
                        
                    }
                    .padding(.top, 160)
                    
                    Spacer()
                    HStack{
                        //button costarina
                        HStack{
                            Image(systemName: "mappin")
                            Text("Coastarina")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(Color("Black900"))
                                .padding(.leading, 12)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 13)
                        .background(.white)
                        .cornerRadius(999)
                        .padding(.horizontal, 28)
                        Spacer()
                    }
                    .padding(.bottom, 240)
                }
                
            }.frame(maxWidth: .infinity, maxHeight: 250)
            
            // Vstack > Text, TextArea, Button
            VStack(alignment: .leading, spacing: 16){
                Text("Thursday, 27 Jul 16:16 PM")
                    .font(.custom("SFProText-Regular", size: 17))
                    .foregroundColor(Color("Black400"))
                    .padding(.leading, 16)
                    .padding(.top, 16)
                
                VStack{
                    ZStack{
                        
                        TextEditor(text: $textInput)
                            .frame(maxWidth:.infinity, maxHeight: 298, alignment: .leading)
                            .foregroundColor(Color("Redish400"))
                            .cornerRadius(30)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .overlay {
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color("Black400"), lineWidth: 1)
                            }
                        if textInput.isEmpty {
                            Text("What's on your mind?")
                                .foregroundColor(Color("Black400"))
                                .padding(.leading, -150)
                                .padding(.top, -140)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                }
                
                Button{
                    router.push(.listMission)
                }label: {
                    Text("Create Memories 􀄯")
                        .font(.custom("SFProText-Medium", size: 17))
                        .foregroundColor(Color.white)
                        .frame(width: 358, height: 64)
                        .background(Color("Redish400"))
                        .clipShape(Capsule())
                    
                }
                .padding(.horizontal, 16)
                
               
            }
            .background(.white)
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct AddnotetophotoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteToPhotoView(picData: Data(count: 0))
    }
}
