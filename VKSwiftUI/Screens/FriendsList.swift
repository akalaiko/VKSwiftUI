//
//  FriendsList.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct FriendsList: View {
    
    @State private var friends: [User] = [
        User(id: 1, firstName: "Hanna", lastName: "Montana", photo: "3", photoBig: "1", sex: 0),
        User(id: 2, firstName: "Walter", lastName: "White", photo: "7", photoBig: "2", sex: 1),
        User(id: 3, firstName: "Jessie", lastName: "Pinkman", photo: "2", photoBig: "3", sex: 1),
        User(id: 4, firstName: "Bobby", lastName: "Axelrod", photo: "4", photoBig: "4", sex: 1),
        User(id: 5, firstName: "Hermione", lastName: "Granger", photo: "1", photoBig: "5", sex: 0),
        User(id: 6, firstName: "Marie", lastName: "Curie", photo: "6", photoBig: "6", sex: 0)
    ]
    
    var body: some View {
        List(friends.sorted(by: { $0.lastName < $1.lastName })) { friend in
            NavigationLink(destination: PhotosView(friend: friend)) {
                FriendCell(name: friend.fullName, avatar: friend.photo)
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}

