//
//  ContentView.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNameTextFiled: String = "12345"
    @State private var lastNameTextFiled: String = "12345"
    @State private var emailTextFiled: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            FloatingBorderTextField(title: "First Name", text: $firstNameTextFiled)
                .validation(NameValidator())
                .required()
                .isEnabled(false)
            
            FloatingBorderTextField(title: "Last Name", text: $lastNameTextFiled)
                .validation(NameValidator())
                .required()

            FloatingBorderTextField(title: "Email", text: $emailTextFiled)
                .validation(ValidationFactory.email)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
