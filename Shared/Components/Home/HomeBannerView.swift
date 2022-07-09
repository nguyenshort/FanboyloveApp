//
//  HomeBannerView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct HomeBannerView: View {
    
    @State var width: CGFloat = .zero
    
    var body: some View {
        
        IntrinsicGeometryReader { proxy in
            
            ZStack {
                
                Color.clear
                    .frame(maxWidth: .infinity)
                
                ImageView("https://i.imgur.com/tE4FCAJ.jpg")
                    .scaledToFill()
                    .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.width * 0.7)
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 0)
            
        }
        
    }
}

struct HomeBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
