//
//  UbicacionesView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 22/3/24.
//

import SwiftUI

struct UbicacionesView: View {
    @StateObject var viewModel = LocationViewModel()
    @State var currentPage = 1
    
    var body: some View {
        NavigationView {
            List(viewModel.listaDeUbicaciones, id: \.id){ location in
                NavigationLink(destination: DetalleUbicacionesView(location: location)){
                    VStack(alignment: .leading){
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                            
                        HStack{
                            Text("Tipo: \(location.type)")
                            Spacer()
                            if location.dimension != "unknown" {
                                Text(location.dimension)
                            }
                            
                        }
                        
                    }
                    .onAppear {
                        if self.viewModel.isLastLocation(location) {
                            print("último episodio")
                            viewModel.getMorelocations(nextPage: currentPage + 1)
                            currentPage += 1
                            print("pagina actual \(currentPage)")
                        }
                    }
                }
                
                
            }.navigationTitle("Ubicaciones")
        }
    }
}

#Preview {
    UbicacionesView()
}
