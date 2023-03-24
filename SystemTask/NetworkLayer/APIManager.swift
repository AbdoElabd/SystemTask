//
//  APIManager.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import Foundation

class RepoAPI {
    static let shared = RepoAPI()
    private init() {}
    
    func fetchRepos(completion: @escaping ([RepoModel]) -> Void) {
        let urlString = "https://api.github.com/users/mralexgray/repos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Repos.self, from: data)
                completion(result)
            } catch {
                print("Error decoding movie data: \(error)")
            }
        }.resume()
    }
}

struct MovieResult: Decodable {
    let results: [RepoModel]
}
