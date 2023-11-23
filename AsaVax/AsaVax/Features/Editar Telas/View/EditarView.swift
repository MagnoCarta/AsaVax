//
//  EditarView.swift
//  AsaVax
//
//  Created by Ana Raiany Guimarães Gomes on 2023-11-23.
//


import SwiftUI

struct EditarView: View {
    
    @State var viewModel: EditarViewModel
    @State var mostraPicker: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        formBody
    }
    
    
    var formBody: some View {
        NavigationStack {
            ZStack {
                Color.neutral800.ignoresSafeArea()
                VStack {
                    Divider()
                        .background(.divider)
                    Form {
                        Section {
                            TextField(Constantes.tituloAtividade, text: $viewModel.tarefaEditada.title)
                                .font(.system(size: 16))
                            Picker(Constantes.lotePickerTitle, selection: $viewModel.tarefaEditada.loteName, content: {
                                ForEach(viewModel.pegarTodosOsLotes(), id: \.self) { tipo in
                                    Text(tipo.name)
                                }
                            })
                            Picker(Constantes.tituloAtividade, selection: $viewModel.tarefaEditada.tipoDeAtividade, content: {
                                ForEach(TipoDeAtividade.allCases, id: \.self) { genero in
                                    Text(genero.rawValue)
                                }
                            })
                            DatePicker(Constantes.tipoName, selection: $viewModel.tarefaEditada.date)
                        }
                        .listRowBackground(Color.neutral700)
                        Section {
                            TextEditor(text: $viewModel.tarefaEditada.descricao)
                                .font(.system(size: 18))
                                .lineLimit(nil)
                                .frame(height: 300)
                        }
                        .listRowBackground(Color.neutral700)
                    }


                    Spacer()
                    Button(action: {
                        viewModel.deleteTarefa()
                        dismiss()
                    }, label: {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .foregroundStyle(.auxiliarError)
                            .frame(maxWidth: .infinity, maxHeight: 50).overlay {
                                Text(Constantes.delete)
                                    .foregroundStyle(.white)
                            }
                    })
                    .padding(.horizontal)
                    .padding(.vertical, 80)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Salvar") {
                            viewModel.editTarefa()
                            dismiss()
                        }
                        .foregroundStyle(.primary100)
                    })
                    ToolbarItem(placement: .topBarLeading, content: {
                        Button("Cancelar") {
                            dismiss()
                        }
                        .foregroundStyle(.primary100)
                        
                    })
                }
                .navigationTitle("Editar atividade")
                .scrollContentBackground(.hidden)
                .interactiveDismissDisabled()
            }
        }}
    
}


struct Constantes {
    static var tituloAtividade: String = "Vacinar as galinhas"
    static var lotePickerTitle: String = "Lote"
    static var atividadeTitle: String = "Tipo de atividade"
    static var tipoName: String = "Tipo de Produção"
    static var generoName: String = "Genero"
    static var delete: String = "Deletar Lote"
    
}


