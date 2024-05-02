//
//  DetalleUbicacionesView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 2/5/24.
//

import SwiftUI

struct DetalleUbicacionesView: View {
    
    var location: Locations
    
    var body: some View {
        Text(location.name)
            .font(.title)
            .padding(.bottom, 20)
            .fontWeight(.bold)
        Text("Residentes")
            .font(.title2)
            .padding(.bottom, 15)
        
        if location.residents.count == 0 {
            Spacer()
            Text("Upss... Parece que aquí no vive nadie")
            Spacer()
        }else{
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]) {
                    
                    ForEach(0..<location.residents.count, id: \.self) { index in
                        NavigationLink(destination: DetallePersonajeView(urlPersonaje: location.residents[index])){
                            CardPersonajeView(urlPersonaje: location.residents[index])
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DetalleUbicacionesView(location: LocationMock.location)
}
