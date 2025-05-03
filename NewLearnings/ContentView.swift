//
//  ContentView.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNameTextFiled: String = ""
    @State private var lastNameTextFiled: String = ""
    @State private var emailTextFiled: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            FloatingBorderTextField(title: "First Name", text: $firstNameTextFiled, validator: ValidationFactory.name)
            FloatingBorderTextField(title: "Last Name", text: $lastNameTextFiled, validator: ValidationFactory.name)
            FloatingBorderTextField(title: "Email", text: $emailTextFiled, validator: ValidationFactory.email)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
