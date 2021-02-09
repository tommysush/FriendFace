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
        // user's name, company and age
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            
            HStack {
                Text("work@")
                Text("\(user.company)")
                    .font(.subheadline)
                
                Spacer()
                
                Text("age:\(user.age)")
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
        }
        
        // use avatar to identify if use is active or not
        UserAvatar(isActive: user.isActive)
            .frame(width: 45, height:45)
            .padding(.horizontal, 15)
    }
}
