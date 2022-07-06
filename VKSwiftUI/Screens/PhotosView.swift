//
//  PhotosView.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct PhotosView: View {
    
    var friend: User
    
    @State var photos = [
        Photo(url: "dog1"),
        Photo(url: "dog2"),
        Photo(url: "dog3"),
        Photo(url: "dog4"),
        Photo(url: "dog5"),
        Photo(url: "dog6"),
        Photo(url: "dog7"),
        Photo(url: "dog8"),
        Photo(url: "dog9")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width / 3
            let rows = [
                GridItem(.flexible(maximum: size), spacing: 0),
                GridItem(.flexible(maximum: size), spacing: 0),
                GridItem(.flexible(maximum: size), spacing: 0)
            ]
            ScrollView(.vertical) {
                Text("\(self.friend.fullName)")
                    .padding()
                    .font(.bold(.system(size: 30))())
                LazyHGrid(rows: rows, spacing: 0) {
                    ForEach(0..<photos.count, id: \.self) { index in
                        Image(photos[index].url)
                            .resizable()
                            .frame(width: size, height: size)
                            .aspectRatio(1, contentMode: .fill)
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.width
                )
            }
            
        }
    }
}


struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(friend: User(id: 1, firstName: "Hanna", lastName: "Montana", photo: "3", photoBig: "1", sex: 0))
    }
}
