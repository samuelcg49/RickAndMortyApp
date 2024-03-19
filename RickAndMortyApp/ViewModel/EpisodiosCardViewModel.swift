//
//  EpisodiosCardViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import Foundation

class EpisodiosCardViewModel: ObservableObject{
    
    @Published var datosEpisodio = [Episodio]()
    
    init() {
        getDatosEpisodio()
    }
    
    func getDatosEpisodio(){
        CardEpisodioView.shared.obtenerPersonajes{ episodio in
            DispatchQueue.main.async{
                switch episodio{
                    case .success(let episodio):
                        self.datosEpisodio = episodio
                    case .failure(let error):
                        print("Error al obtener personajes: \(error)")
                    }
            }
        }
    }
}
