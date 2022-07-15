//
//  SheetHeader.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI

struct SheetHeader: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    var body: some View {
        HStack() {
            
            Text(title)
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .foregroundColor(Color("TextColor"))
            
            Spacer()
            
            Button {
                
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label: {
                
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.gray.opacity(0.4))
                
            }
            
        }
    }
}
