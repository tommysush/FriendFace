//
//  ContentView.swift
//  FriendFace
//
//  Created by SuShenghung on 2021/2/8.
//

import SwiftUI

struct ContentView: View {
    // initiate an empty User array to store our decoded url fetched results
    @State private var users = [User]()
        
    var body: some View {
        NavigationView {
            // list view to show some data of each user
            List(users, id:\.id) { user in
                NavigationLink(destination: UserDetailView(user: user, users: users)) {
                    UserListView(user: user)
                }
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Friend Face")
        }
    }
    
    // MARK: load data from web and decode into custom type
    func loadData() {
        // step.1: validate URL address
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        // step.2: create a URL request without other parameters
        let request = URLRequest(url: url)
        
        // step.3: create a URL session
        URLSession.shared.dataTask(with: request) { data, response, error in
            // step.4: inside completion handler, decode json data into custom Swift's type
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let decodedResponse = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                // showing different error catched
                } catch DecodingError.keyNotFound(let key, let context) {
                    Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                } catch DecodingError.valueNotFound(let type, let context) {
                    Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                } catch DecodingError.dataCorrupted(let context) {
                    Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                } catch let error as NSError {
                    NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                }
                
                // everything is good, so we can exit
                return
            }
        }.resume()
    } // end of function loadData
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
