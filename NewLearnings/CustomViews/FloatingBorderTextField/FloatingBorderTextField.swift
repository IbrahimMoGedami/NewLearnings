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
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
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
                    .disabled(!isEnabled)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isTyping ? .blue : (errorMessage == nil ? .gray : .red), lineWidth: 1)
                            .background(isEnabled ? .white : .gray.opacity(0.05))
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
        .onAppear {
            // Run validation on view load if text has a value or the user is already typing
            if !text.isEmpty || isTyping {
                validate()
            }
        }
        .onChange(of: text) { _, _ in
            // Run validation whenever the text changes (e.g., typing or programmatic update),
            // but only if the user is typing or the text is not empty
            if !text.isEmpty || isTyping {
                validate()
            }
        }
        .onChange(of: isTyping) { _, newValue in
            // Run validation when typing starts/stops,
            // and only if typing or the field already has a value
            if newValue || !text.isEmpty {
                validate()
            }
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

public extension View {
    
    func isEnabled(_ isEnabled: Bool) -> some View {
        self.modifier(EnableFieldModifier(isEnabled: isEnabled))
    }
    
}
