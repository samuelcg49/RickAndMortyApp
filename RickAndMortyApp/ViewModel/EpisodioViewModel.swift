//
//  EpisodioViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import Foundation

class EpisodioViewModel: ObservableObject{
    
    @Published var infoEpisodio: Episodio
    
    
    init(url: String) {
            self.infoEpisodio = Episodio(id: 0, name: "", air_date: "", episode: "", characters: [], url: "", created: "")
            getDatosEpisodio(url: url)
        
        }
    //Obtiene un episodio determinado
    func getDatosEpisodio(url: String){
        APIManager.shared.obtenerDatosEpisodio(url: url){[weak self] resultado in
            DispatchQueue.main.async{
                switch resultado{
                case .success(let episodio):
                    self?.infoEpisodio = episodio
                case .failure(let error):
                    print("Error al obtener datos del episodio: \(error)")
                }
            }
        }
    }
    
    
    
}

