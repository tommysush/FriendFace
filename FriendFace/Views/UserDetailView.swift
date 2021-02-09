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
            // part.1: user's avatar, age and status
            HStack(alignment: .firstTextBaseline) {
                Text(user.isActive ? "Active" : "Not active")
                Spacer()
                UserAvatar(isActive: user.isActive)
                    .frame(width: 120, height: 120)
                    .padding(.top, 15)
                Spacer()
                Text("Age: \(user.age)")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.horizontal, 15)
            
            Divider()
            
            // part.2: user's company, email, and address
            Group {
                HStack(alignment: .firstTextBaseline) {
                    Text("💼")
                    Text(user.company).font(.subheadline)
                    Spacer()
                }
                HStack(alignment: .firstTextBaseline) {
                    Text("📧")
                    Text(user.email).font(.subheadline)
                    Spacer()
                }
                HStack(alignment: .firstTextBaseline) {
                    Text("🏠")
                    Text(user.address).font(.subheadline)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            // part.3: user's about
            GroupBox(label: Text("About")
                        .fontWeight(.bold)
                        .italic()
                        .padding(.bottom, 2)
            ) {
                Text(user.about)
                    .multilineTextAlignment(.leading)
            }
            
            // part4: user's friends list
            VStack(alignment: .leading) {
                Text("Friends")
                    .fontWeight(.bold)
                    .italic()
                    .padding([.horizontal, .top], 15)
                List(user.friends, id:\.id) { friend in
                    Text(friend.name)
                }
                .frame(maxHeight: .infinity)
            }

        } // end of scroll view
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
