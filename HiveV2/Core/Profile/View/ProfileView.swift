//
//  ProfileView.swift
//  HiveV2
//
//  Created by Varun Nair on 3/1/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var radius: Double = 5
    
    var body: some View {
        VStack {
            HStack {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                
            }
            .padding()
            List {
                Section(header: Text("Personal Information")) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Anushka Kapur")
                    }
                    
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("8147773432")
                    }
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Radius: \(Int(radius)) miles")
                    }
                    
                    Slider(value: $radius, in: 1...30, step: 1)
                        .accentColor(colorScheme == .dark ? .white : .black)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
