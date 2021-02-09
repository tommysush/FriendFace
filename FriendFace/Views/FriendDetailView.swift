//
//  FriendDetailView.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/9.
//

import SwiftUI

struct FriendDetailView: View {
    // inform current view that the user object does exist
    var user: User
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                // part.1: user's avatar, age and status
                HStack(alignment: .firstTextBaseline) {
                    Text(user.isActive ? "Active" : "Not active").italic()
                    Spacer()
                    UserAvatar(isActive: user.isActive)
                        .frame(width: 120, height: 120)
                    Spacer()
                    Text("Age: \(user.age)").italic()
                }
                .padding([.horizontal, .top], 15)
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .foregroundColor(user.isActive ? .blue : .secondary)
                
                Divider()
                
                // part.2: user's company, email, and address
                VStack {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "briefcase").foregroundColor(.green)
                            .frame(width: 20, height: 20)
                        Text(user.company).font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "envelope").foregroundColor(.green)
                            .frame(width: 20, height: 20)
                        Text(user.email).font(.subheadline)
                        Spacer()
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "house").foregroundColor(.green)
                            .frame(width: 20, height: 20)
                        Text(user.address).font(.subheadline)
                        Spacer()
                    }
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity)
                
                Divider()
                
                // part.3: user's about
                VStack(alignment: .leading) {
                    Text("About")
                        .fontWeight(.bold)
                        .italic()
                        .padding(.bottom, 1)
                    Text(user.about)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity)
                
                Divider()
                
                // part4: user's friends list
                VStack(alignment: .leading) {
                    Text("Friends")
                        .fontWeight(.bold)
                        .italic()
                        .padding(.bottom, 1)
                    List(user.friends, id:\.id) { friend in
                        HStack {
                            Image(systemName: "person.2")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                                .opacity(0.75)
                            Text(friend.name)
                                .font(.subheadline)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: geo.size.height * 0.35)
                

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
    
}

//struct FriendDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendDetailView()
//    }
//}
