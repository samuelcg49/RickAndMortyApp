//
//  EpisodiosViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 24/4/24.
//

import Foundation

class EpisodiosViewModel: ObservableObject{
    @Published var listaDeEpisodios = [Episodio]()
    
    init(){
        getListaDeEpisodios()

    }
    
    //Obtiene todos los episodios
    func getListaDeEpisodios(){
        APIManager.shared.obtenerEpisodios(pagina: 1){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                    case .success(let episodios):
                        self.listaDeEpisodios = episodios
                    case .failure(let error):
                        print("Error al obtener episodios: \(error)")
                    }
            }
        }
    }
    
    func isLastEpisodio(_ episodio: Episodio) -> Bool {
            guard let lastEpisodio = listaDeEpisodios.last else {
                return false
            }
            return episodio.id == lastEpisodio.id
    }
    
    func getMoreEpisodios(nextPage: Int){
        APIManager.shared.obtenerEpisodios(pagina: nextPage ){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                    case .success(let episodios):
                        self.listaDeEpisodios.append(contentsOf: episodios)
                    case .failure(let error):
                        print("Error al obtener mas episodios: \(error)")
                    }
            }
        }
    }
}
