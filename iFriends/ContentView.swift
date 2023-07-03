//
//  ContentView.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationStack {
            List {
                Section("Active users") {
                    ForEach(users.filter{ $0.isActive }.sorted{ $0.name! < $1.name! }, id: \.id) { user in
                        NavigationLink {
                            DetailView(userId: user.id ?? "")
                        } label: {
                            HStack(spacing: 16) {
                                Circle()
                                    .fill(.green)
                                    .frame(width: 16, height: 16)
                                
                                VStack(alignment: .leading) {
                                    Text("\(user.name ?? "") (\(user.age))")
                                        .font(.headline)
                                    
                                    Text(user.company ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                
                Section("Inactive users") {
                    ForEach(users.filter{ !$0.isActive }.sorted{ $0.name! < $1.name! }, id: \.id) { user in
                        NavigationLink {
                            DetailView(userId: user.id ?? "")
                        }  label: {
                            HStack(spacing: 16) {
                                Circle()
                                    .fill(.red)
                                    .frame(width: 16, height: 16)
                                
                                VStack(alignment: .leading) {
                                    Text("\(user.name ?? "") (\(user.age))")
                                        .font(.headline)
                                    
                                    Text(user.company ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("iFriends")
            .task {
                
                if users.isEmpty {
                    await getUsers()
                }
            }
        }
    }
    
    func getUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                for decodedUser in decodedUsers {
                    let newUser = CachedUser(context: moc)
                    newUser.about = decodedUser.about
                    newUser.address = decodedUser.address
                    newUser.age = Int16(decodedUser.age)
                    newUser.company = decodedUser.company
                    newUser.email = decodedUser.email
                    newUser.id = decodedUser.id
                    newUser.isActive = decodedUser.isActive
                    newUser.name = decodedUser.name
                    newUser.registered = decodedUser.registered
                    newUser.tags = decodedUser.tags.joined(separator: ",")
                }
                
                print("users fetched")
                
                if moc.hasChanges {
                    try? moc.save()
                }
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
