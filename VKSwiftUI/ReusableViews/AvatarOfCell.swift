//
//  AvatarOfCell.swift
//  VKSwiftUI
//
//  Created by Tim on 27.06.2022.
//

import SwiftUI

struct AvatarOfCell: View {
    var content: Image
    private var size = 50.0 
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
            .clipped()
            .setShadow(shadowColor: .black, shadowRadius: 5.0)
    }
    
}

struct CustomShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(
                        color: shadowColor,
                        radius: shadowRadius
                    )
            )
    }
}

extension View {
    func setShadow(shadowColor: Color, shadowRadius: CGFloat) -> some View {
        return self.modifier(CustomShadow(shadowColor: shadowColor, shadowRadius: shadowRadius))
    }
}
