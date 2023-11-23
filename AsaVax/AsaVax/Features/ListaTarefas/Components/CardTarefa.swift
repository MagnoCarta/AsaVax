//
//  CardTarefa.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import SwiftUI

struct CardTarefa: View {
    
    var tarefa: Tarefa
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
            .foregroundStyle(.neutral700)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .overlay {
                VStack(alignment: .leading) {
                    Text(tarefa.title)
                        .font(.custom("Inter", size: 16))
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    Text(tarefa.tipoDeAtividade.rawValue)
                    HStack {
                        Text(tarefa.loteName)
                        .font(.custom("Inter-SemiBold", size: 16))
                        .fontWeight(.semibold)
                        Spacer()
                        Image(.clock)
                        Text("\(Calendar.current.component(.hour, from: tarefa.date)) : \(Calendar.current.component(.minute, from: tarefa.date))")
                            .font(.custom("Inter-SemiBold", size: 14))
                            .fontWeight(.semibold)
                    }
                }
                .padding(16)
            }
    }
}

struct AVSection: View {
    
    var isConcluded: Bool
    var tarefas: [Tarefa]
    @Binding var isSheeting: Bool
    @Binding var tarefaClicada: Tarefa?
    
    var body: some View {
        ZStack {
            Color.neutral800.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(!isConcluded ? "Atividades Pendentes": "Atividades Concluídas")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .fontWeight(.semibold)
                ForEach(tarefas, id: \.self) { tarefa in
                    CardTarefa(tarefa: tarefa)
                        .onTapGesture {
                            isSheeting = true
                            tarefaClicada = tarefa
                        }
                }
                
            }
            .padding(.horizontal)
        }
    }
    
}
