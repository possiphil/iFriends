//
//  DetailView.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    let userId: String
    
    
//    @State private var tags = ""
//    @State private var friends = ""
//    @State private var registered = ""
    
    var body: some View {
        DetailViewList(userId: userId)
//        .onAppear {
//            formatRegisterDate()
//            addTags()
//            addFriends()
//        }
    }
    
//    func formatRegisterDate() {
//        registered = user.registered
//        registered.removeLast(15)
//    }
//
//    func addTags() {
//        for tag in user.tags {
//            if tag != user.tags.last {
//                tags += "\(tag), "
//            } else {
//                tags += tag
//            }
//        }
//    }
//
//    func addFriends() {
//        for friend in user.friends {
//            if friend.id != user.friends.last?.id {
//                friends += "\(friend.name), "
//            } else {
//                friends += friend.name
//            }
//        }
//    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userId: "50a48fa3-2c0f-4397-ac50-64da464f9954")
    }
}
