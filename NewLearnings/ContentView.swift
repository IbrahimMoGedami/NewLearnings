//
//  ContentView.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNameTextFiled: String = ""
    @State private var emailTextFiled: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            FloatingBorderTextField(title: "First Name", text: $firstNameTextFiled)
                .validation(NameValidator(), message: "Name too short.")

            FloatingBorderTextField(title: "Email", text: $emailTextFiled)
                .validation(ValidationFactory.email, message: "Please enter a valid email.")
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
