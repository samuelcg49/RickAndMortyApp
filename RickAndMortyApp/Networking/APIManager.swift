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
    
    private let baseURL = "https://rickandmortyapi.com/api/character?page="
    private let episodiosURL = "https://rickandmortyapi.com/api/episode?page="
    private let locationURL = "https://rickandmortyapi.com/api/location?page="
    
    static let shared = APIManager()
    
    
    func obtenerPersonajes(pagina: Int, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(baseURL)\(pagina)") else {
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
                let datosDecodificados = try JSONDecoder().decode(RespuestaApiPersonajes.self, from: data)
                completion(.success(datosDecodificados.results))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
    
    func obtenerDatosPersonaje(urlPersonaje: String, completion: @escaping (Result<Character, NetworkError>) -> Void){
        guard let url = URL(string: "\(urlPersonaje)") else {
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
                let datosDecodificados = try JSONDecoder().decode(Character.self, from: data)
                completion(.success(datosDecodificados))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
    
    func obtenerDatosEpisodio(url: String, completion: @escaping (Result<Episodio, NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
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
                let datosDecodificados = try JSONDecoder().decode(Episodio.self, from: data)
                completion(.success(datosDecodificados))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
    
    func obtenerEpisodios(pagina: Int, completion: @escaping (Result<[Episodio], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(episodiosURL)\(pagina)") else {
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
                let datosDecodificados = try JSONDecoder().decode(RespuestaApiEpisodios.self, from: data)
                completion(.success(datosDecodificados.results))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
    
    func obtenerUbicaciones(pagina: Int, completion: @escaping (Result<[Locations], NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(locationURL)\(pagina)") else {
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
                let datosDecodificados = try JSONDecoder().decode(RespuestaApiLocation.self, from: data)
                completion(.success(datosDecodificados.results))
                
            }catch{
                completion(.failure(.invalidResponse))
                return
            }
            
        }.resume()
    }
    
}
