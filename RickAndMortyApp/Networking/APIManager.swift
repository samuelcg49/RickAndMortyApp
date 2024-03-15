//
//  ApiManager.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 14/3/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData
    case decodingError(Error)
}

class APIManager{
    
    private let baseURL = "https://rickandmortyapi.com/api/character"
    static let shared = APIManager()
    
    
    func obtenerPersonajes(completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ datos, respuesta, error in
            
            if let error = error {
                completion(.failure(.requestFailed(error.localizedDescription as! Error)))
                return
            }
            
            guard let data = datos else {
                completion(.failure(.invalidData))
                return
            }
           
            do{
                let datosDecodificados = try JSONDecoder().decode(RespuestaAPI.self, from: data)
                completion(.success(datosDecodificados.results))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
}
