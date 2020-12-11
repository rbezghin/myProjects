//
//  Service.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/9/20.
//

import Foundation

class Service{
    
    static let shared = Service() //singleton
    
    func fetchSearchedApps(searchTerm: String, completion: @escaping ([Result]?, Error?) -> ()){
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completion(nil, error)
            }
                let decoder = JSONDecoder()
                do {
                    let searchResults = try decoder.decode(AppSearchResult.self, from: data!)
                    completion(searchResults.results, nil)
                } catch let err {
                    print(err)
                    completion(nil, err)
                }
        }.resume()
    }

}
