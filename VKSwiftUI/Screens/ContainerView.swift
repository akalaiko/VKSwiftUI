//
//  ContainerView.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var showFriends = false
    
    var body: some View {
            NavigationView {
                HStack {
                    Login(isLoggedIn: $showFriends)
                    NavigationLink(
                        destination: TabBar(),
                        isActive: $showFriends
                    ) {
                        EmptyView()
                    }
                }
            }
    }
}


struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
