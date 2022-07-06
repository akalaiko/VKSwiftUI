//
//  TabBar.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectionView = 1
    
    private var navTitleName = ["News", "Friends", "Groups"]
    
    var body: some View {
        TabView(selection: $selectionView) {
            NewsList()
                .tabItem {
                    Text(navTitleName[0])
                    Image(systemName: "newspaper")
                }.tag(1)
            FriendsList()
                .tabItem {
                    Text(navTitleName[1])
                    Image(systemName: "person.3.sequence")
                }.tag(2)
            GroupsList()
                .tabItem {
                    Text(navTitleName[2])
                    Image(systemName: "rectangle.3.group")
                }.tag(3)
        }.navigationTitle(navTitleName[selectionView - 1])
    }
}
