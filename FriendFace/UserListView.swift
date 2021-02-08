//
//  UserListView.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/8.
//

import SwiftUI

struct UserListView: View {
    // inform current view that the user object does exist
    var user: User
    
    var body: some View {
        // user's name and age
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            Text("(age:\(user.age))")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
        Spacer()
        
        // user's company
        VStack(alignment: .trailing) {
            Text("work@")
                .foregroundColor(.secondary)
            Text("\(user.company)")
                .font(.headline)
                .italic()
        }
        
        // use avatar to identify if use is active or not
        UserAvatar(isActive: user.isActive)
            .frame(width: 35, height:35)
            .padding(.leading, 5)
    }
}
