//
//  MainTabView.swift
//  HiveV2
//
//  Created by Varun Nair on 3/1/24.
//

import SwiftUI
import MapKit

struct MainTabView: View {
    
    @State private var showSheet: Bool = false
    @State private var activeTab: Tab = .people
    @State private var isSearching = false
    
    @ViewBuilder
    var selectedTabView: some View {
        switch activeTab {
        case .people:
            PeopleView()
        case .messages:
            MessagesView()
        case .events:
            EventsView()
        case .profile:
            ProfileView()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
//            if #available(iOS 17, *) {
//                Map()
//            } else {
//                Text("Display ios 16 compatible map here")
//            }
            selectedTabView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack(alignment: .leading, spacing: 0, content: {
                HStack {
                    Text(activeTab.rawValue)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.snappy) {
                            isSearching.toggle()
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundStyle(.black)
                            .padding()
                    })
                }
                .padding(.top, 1)
                
                switch activeTab {
                case .people:
                    PeopleBottomSheetView(isSearching: $isSearching)
                case .messages:
                    MessagesBottomSheetView()
                case .events:
                    EventsBottomSheetView()
                case .profile:
                    ProfileBottomSheetView()
                }
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.ultraThinMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet()
        }
    }
    
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button(action: { activeTab = tab }, label: {
                    VStack(spacing: 2) {
                        Spacer()
                        Spacer()
                        
                        Image(systemName: tab.symbol)
                            .font(.title2)
                        
                        Text(tab.rawValue)
                            .font(.caption2)
                    }
                    .foregroundStyle(activeTab == tab ? Color.accentColor: .gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                })
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    MainTabView()
}
