//
//  CardEpisodioView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import SwiftUI

struct CardEpisodioView: View {
    
    @StateObject var viewModel: EpisodioViewModel
    @State var indiceEpisodio: String
    
    init(urlEpisodio: String) {
        self._viewModel = StateObject(wrappedValue: EpisodioViewModel(url: urlEpisodio))
        self._indiceEpisodio = State(initialValue: urlEpisodio)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(viewModel.infoEpisodio.name)
                .foregroundColor(.black)
            Spacer().frame(height: 5)
            Text(viewModel.infoEpisodio.episode)
            Spacer().frame(height: 5)
            Text(viewModel.infoEpisodio.air_date)
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 10) // Redondea las esquinas de la superposición
                .stroke(Color.blue, lineWidth: 3) // Agrega un borde azul
        )
        
            
    }
    
    
}


#Preview {
    CardEpisodioView(urlEpisodio: "https://rickandmortyapi.com/api/episode/1")
}
