//
//  FriendListView.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/9.
//

import SwiftUI

// custom row view which is used in UserDetailView to complete friends' list
struct FriendListView: View {
    // inform current view that the user object does exist
    var user: User
    
    var body: some View {
        HStack {
            Image(systemName: "person.2")
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .opacity(0.75)
            Text(user.name)
                .font(.subheadline)
            Spacer()
            Text("work@\(user.company)")
                .font(.subheadline)
                .frame(width:150, alignment: .leading)
                .foregroundColor(.secondary)
        }
    }
}

//struct FriendListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
