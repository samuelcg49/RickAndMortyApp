//
//  CardPersonajeView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 1/5/24.
//

import SwiftUI

struct CardPersonajeView: View {
    @State var personaje: Character
    
    var body: some View {
      
        VStack {
            AsyncImage(url: URL(string: personaje.image)){ image in
                image.resizable().frame(maxWidth: 130, maxHeight: 130)
            } placeholder: {
                ProgressView()
            }.padding(.bottom, 15)
            Text(personaje.name)
            
        }.padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).background(Color.gray.opacity(0.30))
        
    }
}

#Preview {
    CardPersonajeView(personaje: PersonajeMock.personaje)
}
