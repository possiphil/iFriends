//
//  DetailViewList.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import CoreData
import SwiftUI

struct DetailViewList: View {
    @FetchRequest var user: FetchedResults<CachedUser>
    
    init(userId: String) {
        _user = FetchRequest<CachedUser>(sortDescriptors: [], predicate: NSPredicate(format: "id == %@", userId))
    }
    
    var body: some View {
        List(user, id: \.self) { item in
            Text(item.name ?? "")
            Text(item.address ?? "")
            Text(item.email ?? "")
            Text(item.about ?? "")
        }
    }
}
