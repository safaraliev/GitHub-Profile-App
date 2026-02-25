//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 2/23/26.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    
    let baseURL = "https://api.github.com/users"
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100$page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Try again")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            <#code#>
        }
        task.resume()
        
    }
}
