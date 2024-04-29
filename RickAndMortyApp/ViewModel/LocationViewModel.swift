//
//  LocationViewModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 29/4/24.
//

import Foundation

class LocationViewModel: ObservableObject{
    @Published var listaDeUbicaciones = [Locations]()
    
    init(){
        getListaDeUbicaciones()
    }
    
    func getListaDeUbicaciones(){
        APIManager.shared.obtenerUbicaciones(pagina: 1){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                case .success(let ubicaciones):
                    self.listaDeUbicaciones = ubicaciones
                case .failure(let error):
                    print("Error al obtener episodios: \(error)")
                }
            }
        }
    }
    
    func isLastLocation(_ location: Locations) -> Bool {
        guard let lastLocation = listaDeUbicaciones.last else {
            return false
        }
        return location.id == lastLocation.id
    }
    
    func getMorelocations(nextPage: Int){
        APIManager.shared.obtenerUbicaciones(pagina: nextPage ){ resultado in
            DispatchQueue.main.async{
                switch resultado{
                case .success(let locations):
                    self.listaDeUbicaciones.append(contentsOf: locations)
                case .failure(let error):
                    print("Error al obtener mas episodios: \(error)")
                }
            }
        }
    }
    
}
