//
//  UserAvatar.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/8.
//

import SwiftUI

struct UserAvatar: View {
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: geo.size.width)
                .foregroundColor(isActive ? .blue : .secondary)
        }
    }
}

struct UserAvatar_Previews: PreviewProvider {
    static var previews: some View {
        UserAvatar(isActive: false)
    }
}
