//
//  FloatingBorderTextField.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI

struct FloatingBorderTextField: View {
    
    let title: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(height: 50)
                .focused($isTyping)
                .background(isTyping ? .blue : .gray, in: RoundedRectangle(cornerRadius: 14).stroke(lineWidth: 2))
            
            Text(title)
                .padding(.horizontal, 5)
                .background(.white.opacity(isTyping || !text.isEmpty ? 1 : 0))
                .foregroundStyle(isTyping ? .blue : .gray)
                .padding(.leading).offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
        }
        .animation(.linear(duration: 0.2), value: isTyping)
    }
    
}
