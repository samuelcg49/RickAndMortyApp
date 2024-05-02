//
//  DetalleEpisodioView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 30/4/24.
//

import SwiftUI

struct DetalleEpisodioView: View {
    
    @State var urlPersonaje = ""
    @StateObject var viewModel: EpisodioViewModel
    @State var indiceEpisodio: String
    
    init(urlEpisodio: String) {
        self._viewModel = StateObject(wrappedValue: EpisodioViewModel(url: urlEpisodio))
        self._indiceEpisodio = State(initialValue: urlEpisodio)
    }
    
    
    var body: some View {
        VStack {
            Text(viewModel.episodio.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            Text("Fecha de emisión: \(viewModel.episodio.air_date)")
        }
        .padding(.bottom, 50)
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]) {
                ForEach(0..<viewModel.episodio.characters.count, id: \.self) { index in
                    NavigationLink(destination: DetallePersonajeView(urlPersonaje: viewModel.episodio.characters[index])){
                        CardPersonajeView(urlPersonaje: viewModel.episodio.characters[index])
                    }
                    
                }
                
            }
        }
        
    }
}


#Preview {
    DetalleEpisodioView(urlEpisodio: "https://rickandmortyapi.com/api/episode/1")
}
