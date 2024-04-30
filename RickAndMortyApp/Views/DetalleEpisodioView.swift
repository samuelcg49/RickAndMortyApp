//
//  DetalleEpisodioView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 30/4/24.
//

import SwiftUI

struct DetalleEpisodioView: View {
     var episodio: Episodio
    
    var body: some View {
        VStack {
            Text(episodio.name)
                .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 30)
            Text("Fecha de emisión: \(episodio.air_date)")
            
            // Incluir lista de personajes del capítulo
            
        }

    }
}


#Preview {
    DetalleEpisodioView(episodio: EpisodioMock.episodio)
}
