//
//  DetalleEpisodioView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 30/4/24.
//

import SwiftUI

struct DetalleEpisodioView: View {
    var episodio: Episodio
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            Text(episodio.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            Text("Fecha de emisión: \(episodio.air_date)")
        }
        .padding(.bottom, 50)
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]) {
                ForEach(viewModel.listaDePersonajes, id: \.id) { personaje in
                    CardPersonajeView(personaje: personaje)
                }
                
            }
        }
        
    }
}


#Preview {
    DetalleEpisodioView(episodio: EpisodioMock.episodio)
}
