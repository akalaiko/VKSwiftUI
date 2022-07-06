//
//  GroupsList.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct GroupsList: View {
    
    @State private var groups: [Group] = [
        Group(id: 2, name: "Apple Fanboys", avatar: "apple"),
        Group(id: 3, name: "Ноготочки ЕКБ", avatar: "women"),
        Group(id: 4, name: "Официальное сообщество плоскоземельщиков", avatar: "emc2"),
        Group(id: 5, name: "С детства за Ньюкасл", avatar: "cup"),
        Group(id: 6, name: "Книжный клуб", avatar: "book"),
        Group(id: 1, name: "Детективы Новосибирска", avatar: "default")
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name })) { group in
            FriendCell(name: group.name, avatar: group.avatar)
        }
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
    }
}
