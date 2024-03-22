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
                    // Contenido de la primera pestaña
                    PersonajesView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Personajes")
                        }
                    
                    // Contenido de la segunda pestaña
                    EpisodiosView()
                        .tabItem {
                            Image(systemName: "tv")
                            Text("Episodios")
                        }
            
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
