//
//  WelcomeKids.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct WelcomeKids: View {
    
    @Binding var offset: CGFloat
    
    fileprivate func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var body: some View {
        VStack {
            OffsetPageTabView(offset: $offset) {
                
                HStack(alignment: .top) {
                    
                    ForEach(_onBoardings) { page in
                        
                        VStack {
                            
                            Image(page.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220)
                                .padding(.top, 150)
                            
                        }
                        .frame(width: screenWidth())
                        
                    }
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)

            }
            // .background(Color.white)
        }
    }
}

struct WelcomeKids_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            WelcomeView()
            
        }
    }
}

