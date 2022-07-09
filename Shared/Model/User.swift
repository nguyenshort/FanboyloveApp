//
//  User.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct User: Identifiable {
    let id: String
    var name: String
    var slug: String
    var avatar: String
    
}


let _bookmarkers: [User] = [
    
    User(id: "1", name: "Nguyên", slug: "nguyen", avatar: "https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ"),
    User(id: "2", name: "Kim Ngân", slug: "nguyen", avatar: "https://user-pic.webnovel.com/userheadimg/4303024487-10/1.jpg"),
    User(id: "3", name: "Trọng Sơn", slug: "nguyen", avatar: "https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ"),
    User(id: "4", name: "Đông Phương", slug: "nguyen", avatar: "https://user-pic.webnovel.com/userheadimg/4303024487-10/1.jpg")
    
]
