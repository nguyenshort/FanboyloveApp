//
//  SessionBlock.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI

struct SessionBlock<Label: View, Content: View> : View {
    var title: String
    var action: Label
    var content: Content
    
    public init(
        title: String,
        @ViewBuilder action: @escaping () -> Label,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.action = action()
        self.content = content()
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 17) {
            
            TitleView(title: title) {
                action
            }
            
            content
            
        }
        
    }
}

extension SessionBlock where Label == EmptyView {
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.init(title: title, action: { EmptyView() }, content: content)
    }
}

struct SessionBlock_Previews: PreviewProvider {
    static var previews: some View {
        
        SessionBlock(title: "Description") {
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
                .foregroundColor(Color("TextContentColor"))

            
        }
        .padding()

    }
}
