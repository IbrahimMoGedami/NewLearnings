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
    @State private var errorMessage: String?
    
    @FocusState private var isTyping: Bool
    
    @State private var showRequiredMark = true
    
    public init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
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
        if let validator = validator {
            errorMessage = validator.validate(text)
        }
    }
    
}

public extension FloatingBorderTextField {
    
    func validation(_ validator: TextFieldValidator) -> FloatingBorderTextField {
        var view = self
        view._validator = State(initialValue: validator)
        return view
    }
    
    func required() -> some View {
        modifier(RequiredFieldModifier())
    }

}
