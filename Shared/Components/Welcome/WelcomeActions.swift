//
//  WelcomeActions.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct WelcomeActions: View {
    
    @Binding var currentIndex: Int
    @Binding var offset: CGFloat
    
    var body: some View {
        VStack {
            
            Text(_onBoardings[currentIndex].title)
                .foregroundColor(.white)
                .font(.system(size: 28))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            
            Text(_onBoardings[currentIndex].description)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.top, 20)
            
            HStack(alignment: .center) {
                
                HStack(spacing: 15) {
        
                    ForEach(Array(_onBoardings.enumerated()), id: \.offset) { index, item in
                        
                        Capsule()
                            .fill(.white)
                            .frame(width: currentIndex == index ? 20 : 7, height: 7)
                            .animation(.linear, value: currentIndex)
                        
                    }
                    
                }
                .overlay(alignment: .leading) {
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: CGFloat(currentIndex * 20))
                        .animation(.linear, value: currentIndex)

                }
                
                Spacer()
                
                Button {
                    
                    if currentIndex < _onBoardings.count - 1 {
                        offset = CGFloat(currentIndex + 1) * screenWidth()
                    } else {
                        // Todo: off welcome
                    }
                    
                } label: {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 64, height: 64)
                        .overlay {
                            Group {
                                
                                if currentIndex < _onBoardings.count - 1 {
                                    
                                    Image(systemName: "arrow.right")
                                        .font(.title2)
                                        .foregroundColor(Color("TextContentColor"))
                                        .animation(.linear, value: currentIndex)
                                        .transition(.scale)

                                    
                                } else {
                                    
                                    Image(systemName: "checkmark")
                                        .font(.title2)
                                        .foregroundColor(Color("TextContentColor"))
                                        .animation(.linear, value: currentIndex)
                                        .transition(.scale)

                                    
                                }
                                
                            }
                        }
                    
                }

                
            }
            .padding(.top, 40)
            
        }
    }
    
    func getOffset() -> Void {
        // let progess =
    }
}

struct WelcomeActions_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            WelcomeView()
            
        }
    }
}
