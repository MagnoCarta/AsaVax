//
//  CadastroView.swift
//  AsaVax
//
//  Created by Ana Raiany Guimarães Gomes on 2023-11-23.

import SwiftUI

struct CadastroView: View {
    
    @State var viewModel: CadastroViewModel
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
                            TextField(Constants.cadastroName, text: $viewModel.editedBatch.name)
                                .font(.system(size: 16))
                            TextField(Constants.quantidadeTitle, text: $viewModel.editedBatch.numberBought)
                                .font(.system(size: 16))
                            Picker(Constants.tipoName, selection: $viewModel.editedBatch.tipo, content: {
                                ForEach(TipoDoLote.allCases, id: \.self) { tipo in
                                    Text(tipo.rawValue)
                                }
                            })
                            Picker(Constants.generoName, selection: $viewModel.editedBatch.genero, content: {
                                ForEach(Genero.allCases, id: \.self) { genero in
                                    Text(genero.rawValue)
                                }
                            })
                            DatePicker(Constants.datePickerTitle, selection: $viewModel.editedBatch.date)
                        }
                        .listRowBackground(Color.neutral700)
                    }
                    Spacer()
                    Button(action: {
                        viewModel.deleteBatch()
                    }, label: {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity, maxHeight: 50).overlay {
                                Text(Constants.delete)
                                    .foregroundStyle(.white)
                            }
                    })
                    .padding(.horizontal)
                    .padding(.vertical, 80)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Salvar") {
                            viewModel.editBatch()
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
                .navigationTitle("Editar Lote")
                .scrollContentBackground(.hidden)
                .interactiveDismissDisabled()
            }
        }}
    
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Constants {
    static var cadastroName: String = "Nome"
    static var quantidadeTitle: String = "Quantidade comprada"
    static var datePickerTitle: String = "Data"
    static var PickerTitle: String = "Data de compra"
    static var tipoName: String = "Tipo de Produção"
    static var generoName: String = "Genero"
    static var delete: String = "Deletar Lote"
}

