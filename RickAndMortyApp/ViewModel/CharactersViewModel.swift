//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 15/3/24.
//

import Foundation

class CharactersViewModel: ObservableObject{
    
    @Published var listaDePersonajes = [Character]()
    
    
    init() {
        getListaDePersonajes()
    }
    
    func getListaDePersonajes(){
        APIManager.shared.obtenerPersonajes(pagina: 1){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                    case .success(let characters):
                        self.listaDePersonajes = characters
                    case .failure(let error):
                        print("Error al obtener personajes: \(error)")
                    }
            }
        }
    }
    
    func isLastPersonaje(_ personaje: Character) -> Bool {
            guard let lastPersonaje = listaDePersonajes.last else {
                return false
            }
            return personaje.id == lastPersonaje.id
    }
    
    func getMorePersonajes(nextPage: Int, numeroPersonaje: Int?){   
        print("GetMorePersonajes ejecutado")
        APIManager.shared.obtenerPersonajes(pagina: nextPage){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                    case .success(let characters):
                        self.listaDePersonajes.append(contentsOf: characters)
                    case .failure(let error):
                        print("Error al obtener personajes: \(error)")
                    }
            }
        }
    }
}

