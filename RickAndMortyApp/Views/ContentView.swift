//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 22/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Vista de personajes
            PersonajesView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Personajes")
                }
            
            // Vista de episodios
            EpisodiosView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episodios")
                }
            
            // Vista de ubicaciones
            UbicacionesView().tabItem{
                Image(systemName: "globe")
                Text("Ubicaciones")
            }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
