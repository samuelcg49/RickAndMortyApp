//
//  EpisodioViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import Foundation

class EpisodioViewModel: ObservableObject{
    
    @Published var episodio: Episodio
    @Published var listaDeEpisodios = [Episodio]()
    
    init(url: String?) {
        self.episodio = Episodio(id: 0, name: "", air_date: "", episode: "", characters: [], url: "", created: "")
        
        getDatosEpisodio(url: url!)
        
        getListaDeEpisodios()
    }
    
    //Obtiene un episodio determinado
    func getDatosEpisodio(url: String){
        APIManager.shared.obtenerDatosEpisodio(url: url){[weak self] resultado in
            DispatchQueue.main.async{
                switch resultado{
                case .success(let episodio):
                    self?.episodio = episodio
                case .failure(let error):
                    print("Error al obtener datos del episodio: \(error)")
                }
            }
        }
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

