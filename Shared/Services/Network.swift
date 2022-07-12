//
//  Network.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 09/07/2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    
    static let useApollo = shared.apollo
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
}
