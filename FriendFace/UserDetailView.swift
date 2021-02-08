//
//  UserDetailView.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/9.
//

import SwiftUI

struct UserDetailView: View {
    // inform current view that the user object does exist
    var user: User
    
    var body: some View {
        ScrollView(.vertical) {
            // TODO: finish user detail view
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(user.name)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView()
//    }
//}
