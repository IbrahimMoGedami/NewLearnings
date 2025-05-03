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
                .validation(NameValidator())

            FloatingBorderTextField(title: "Email", text: $emailTextFiled)
                .validation(ValidationFactory.email)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
