//
//  GroupCell.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct GroupCell: View {
    
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
                .layoutPriority(1)
        }
        .padding()
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(name: "Harry Potter fans", avatar: "book")
    }
}
