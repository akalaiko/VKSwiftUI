//
//  FriendCell.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct FriendCell: View {
    
    let name: String
    let avatar: String
    
    var body: some View {
        HStack {
            AvatarOfCell {
                Image(avatar)
            }
            
            Text(name)
                .font(.system(size: 20))
                .padding(.leading, 20)
                .lineLimit(1)
        }
        .padding()
    }
}

struct FriendsCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(name: "Hermione Granger", avatar: "1")
    }
}
