//
//  ListaDeCards.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import SwiftUI

struct ListaDeCards: View {
    
    @State var viewModel: ListaDeCardsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.neutral800.ignoresSafeArea()
                ScrollView {
                    VStack {
                        ForEach(viewModel.lotes) { lote in
                            NavigationLink(destination: {
                                LoteInformationView(price: .init(lote: lote), lote: lote)
                            }, label: {
                                CardLotes(lote: lote)
                                    .padding(.horizontal,24)
                            })
                        }
                    }
                }
                .background(.neutral800)
                .navigationTitle("Lotes")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Text("Adicionar")
                            .foregroundStyle(.primary100)
                            .onTapGesture {
                                viewModel.isSheeting = true
                            }
                    })
                }
                .sheet(isPresented: $viewModel.isSheeting, onDismiss: {
                    viewModel.loteClicado = nil
                    viewModel.fetchLotes()
                }, content: {
                    if let lote = viewModel.loteClicado {
                        CadastroView(viewModel: .init(batch: lote))
                    } else {
                        CadastroView(viewModel: .init())
                    }
                })
            }
        }
    }
    
}
