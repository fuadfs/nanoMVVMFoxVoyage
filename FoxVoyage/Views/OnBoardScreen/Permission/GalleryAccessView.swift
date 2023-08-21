//
//  GalleryAccessView.swift
//  FoxVoyage
//
//  Created by Rahmi Umarefi on 20/07/23.
//

import SwiftUI
import Photos

struct GalleryAccessView: View {
    @State private var isGalleryAccessGranted = false
    @ObservedObject var galleryAcces: GalleryAccess
    
    var body: some View {
        VStack{
            VStack {
                Text("Immerse yourself ")
                + Text("in the ")
                    .foregroundColor(Color("Black200"))
                + Text("complete experience allow access ")
                + Text("to the ")
                    .foregroundColor(Color("Black200"))
                + Text("gallery")
            }
            .font(.largeTitle)
            .frame(maxWidth: 355, alignment: .leading)
            
            Image("galleryAccess")
                .padding(.top,15)
            
            Text("Let's explore your gallery together! Allow access to preserve your travel memories beautifully")
                .font(.body)
                .frame(maxWidth: 360, alignment: .leading)
                .padding(.top, 20)
            
            Spacer()
            
            Button("Give Access") {
                galleryAcces.requestGalleryAccess { isGranted in
                    isGalleryAccessGranted = isGranted
                }
            }
            .buttonStyle(ButtonOnBoardScreen())
            
            NavigationLink(
                destination: InformationNameView(),
                isActive: $isGalleryAccessGranted,
                label: { EmptyView() }
            )
            .hidden()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct GalleryAccessView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryAccessView(galleryAcces: GalleryAccess())
    }
}
