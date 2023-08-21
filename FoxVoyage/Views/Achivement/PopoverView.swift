//
//  PopoverView.swift
//  FoxVoyage
//
//  Created by Nindya Alita Rosalia on 29/07/23.
//

import SwiftUI

struct PopoverView: View {
    @State private var isShowingPopover = false
    
    var body: some View {
        VStack {
            // Add your main content here
            
            Button("Show Popover", action: {
                isShowingPopover.toggle()
            })
            .padding()
            .popover(isPresented: $isShowingPopover, content: {
                PopovercardView()
            })
        }
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
