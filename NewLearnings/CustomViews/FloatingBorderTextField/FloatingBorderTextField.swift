//
//  FloatingBorderTextField.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI

public struct FloatingBorderTextField: View {
    
    let title: String
    @Binding var text: String
    
    @State private var validator: TextFieldValidator?
    @State private var validationMessage: String?
    
    @FocusState private var isTyping: Bool
    @State private var errorMessage: String?
    
    public init(title: String, text: Binding<String>, validator: TextFieldValidator? = nil) {
        self.title = title
        self._text = text
        self.validator = validator
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .leading) {
                TextField("", text: $text)
                    .padding(.leading)
                    .frame(height: 50)
                    .focused($isTyping)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isTyping ? .blue : (errorMessage == nil ? .gray : .red), lineWidth: 1)
                    )
                
                Text(title)
                    .padding(.horizontal, 5)
                    .background(.white.opacity(isTyping || !text.isEmpty ? 1 : 0))
                    .foregroundStyle(isTyping ? .blue : (errorMessage == nil ? .gray : .red))
                    .padding(.leading)
                    .offset(y: isTyping || !text.isEmpty ? -27 : 0)
                    .onTapGesture {
                        isTyping = true
                    }
            }
            .animation(.linear(duration: 0.1), value: isTyping)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
                    .padding(.leading, 8)
            }
        }
        .onChange(of: text) { _, _ in
            validate()
        }
    }
    
    private func validate() {
        if let validator = validator,
           let validationMessage = validationMessage {
            errorMessage = validator.validate(text, message: validationMessage)
        }
    }
    
}

public extension FloatingBorderTextField {
    
    func validation(_ validator: TextFieldValidator, message: String) -> FloatingBorderTextField {
        var view = self
        view._validator = State(initialValue: validator)
        view._validationMessage = State(initialValue: message)
        return view
    }
    
}
