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
    
    var body: some View {
        VStack(spacing: 50) {
            FloatingBorderTextField(title: "First Name", text: $firstNameTextFiled)
            FloatingBorderTextField(title: "Last Name", text: $lastNameTextFiled)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
