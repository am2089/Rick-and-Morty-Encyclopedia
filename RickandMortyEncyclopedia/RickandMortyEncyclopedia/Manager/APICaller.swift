//
//  ApiCaller.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/28/22.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    
    struct Constants {
        static let allCharactersURL = URL(string: "https://rickandmortyapi.com/api/character")
        
        static let searchUrlString = "https://rickandmortyapi.com/api/character/?name="
    }
    
    private init(){}
    
    
    public func getAllCharacters(completion: @escaping(Result<[Characters], Error>) -> Void) {
        guard let url = Constants.allCharactersURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.results.count)")
                    completion(.success(result.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    // Search Query
    
    public func search(with query: String, completion: @escaping(Result<[Characters], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.results.count)")
                    completion(.success(result.results))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    
}
