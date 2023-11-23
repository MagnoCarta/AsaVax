//
//  ListaTarefasView.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation
import SwiftUI

struct ListaTarefasView: View {
    
    var viewModel: ListaTarefasViewModel
    
    var body: some View {
        ZStack {
            Color.neutral800.ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    VStack {
                        SegmentPicker()
                            .padding()
                        VStack(spacing: 32) {
                            AVSection(isConcluded: false, tarefas:  viewModel.tarefasPendentes())
                            AVSection(isConcluded: false, tarefas:  viewModel.tarefasConcluidas())
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Image(systemName: "plus")
                            .foregroundStyle(.primary100)
                            .onTapGesture {
                                
                            }
                    })
                    ToolbarItem(placement: .principal, content: {
                            Text(viewModel.getDay(date: .now))
                                .font(.custom("Inter", size: 24))
                                .fontWeight(.semibold)
                    })
                }
                .background(.neutral800)
            }
            .background(.neutral800)
                
        }
    }
}
