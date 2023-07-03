//
//  BasicV.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import SwiftUI

fileprivate let str = """
{
    "first": "Andrew",
    "last": "Glouberman"
}
"""

struct UserTest: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    var firstName: String
    var lastName: String
}

struct BasicV: View {
    var body: some View {
        VStack {
            Button("Press me") {
                loadJSON()
            }
        }
    }
    
    func loadJSON() {
        do {
            let decoder = JSONDecoder()
    //        decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let data = Data(str.utf8)

            let user = try decoder.decode(UserTest.self, from: data)
            print("Hi, I'm \(user.firstName) \(user.lastName)")
        } catch {
            print("Whoops: \(error.localizedDescription)")
        }
    }
}

struct BasicV_Previews: PreviewProvider {
    static var previews: some View {
        BasicV()
    }
}
