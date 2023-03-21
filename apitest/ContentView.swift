//
//  ContentView.swift
//  apitest
//
//  Created by Stanis Humez on 21/03/2023.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var users: Users = []
    
    func refreshUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users").response { response in
            if let data = response.data {
                
                users = try! JSONDecoder().decode(Users.self, from: data).shuffled()
            } else {
                print("Erreur")
            }
        }
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section("Users") {
                        ForEach(users) { user in
                            NavigationLink(value: user) {
                                Text(user.name)
                            }
                        }
                    }
                }.navigationDestination(for: User.self) { user in
                    Form {
                        Section("Informations") {
                            HStack {
                                Text("Nom")
                                Text(user.name)
                            }
                            HStack {
                                Text("Email")
                                Text(user.email)
                            }
                        }
                    }
                }
                
            }
            
        }.refreshable {
            refreshUsers()
        }
        .onAppear() {
            refreshUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
