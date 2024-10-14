//
//  ProfileView.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var username = "John Doe"
    @State private var email = "john@example.com"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                
                Section {
                    Button("Log Out") {
                        // Implement log out functionality
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
