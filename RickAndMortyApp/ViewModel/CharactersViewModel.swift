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
        APIManager.shared.obtenerPersonajes{ resultado in
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
}

