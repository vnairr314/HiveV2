//
//  PeopleBottomSheetView.swift
//  HiveV2
//
//  Created by Varun Nair on 3/1/24.
//

import SwiftUI

struct PeopleBottomSheetView: View {
    @State private var searchText = ""
    @Binding var isSearching: Bool

    let friends = ["Anushka Kapur", "Keith Ashley Percy", "Varun Nair"]

    var body: some View {
        VStack(spacing: 0) {
            if isSearching {
                TextField("Search...", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .transition(.move(edge: .top))
            }
            
            ScrollView {
                LazyVStack { // Using LazyVStack for better performance
                    ForEach(friends.filter { $0.lowercased().contains(searchText.lowercased()) || searchText.isEmpty }, id: \.self) { friend in
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                            Text(friend)
                                .padding(.vertical, 8)
                            Spacer()
                            Text("0 km")
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
            }
        }
//        .animation(.default, value: isSearching)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Align content to top
    }

}

#Preview {
    MainTabView()
}
