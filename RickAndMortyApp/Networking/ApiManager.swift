//
//  ApiManager.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 14/3/24.
//

import Foundation

class APIManager {
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching characters: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let characters = try JSONDecoder().decode(RespuestaAPI.self, from: data)
                completion(characters.results)
            } catch {
                print("Error decoding characters: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
