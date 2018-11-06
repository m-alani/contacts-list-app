//
//  Network.swift
//  Contacts List
//
//  Created by Marwan Alani on 2018-11-03.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

import Foundation

// MARK: Completion handler defenitions (typealiases)
typealias FetchUsersCompletionHandler = ([User]) -> Void

// MARK: Netwrok calls' functions

struct Network {
    static func fetchUsers(_ completionHandler: @escaping FetchUsersCompletionHandler) {
        guard let url = URL(string: apiUrlString) else { return }
        let networkCall = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Make sure everything went well with the network fetch
            guard let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                let unwrappedData = data,
                error == nil
                else {
                    completionHandler([User]())
                    return
                }
            
            // Decode retrived data
            let apiResponse = try? JSONDecoder().decode(ApiResponse.self, from: unwrappedData)
            if let unwrappedApiResponse = apiResponse {
                completionHandler(unwrappedApiResponse.results.map({ User(fromNetworkUser: $0) }))
            }
        }
        networkCall.resume()
    }
}

