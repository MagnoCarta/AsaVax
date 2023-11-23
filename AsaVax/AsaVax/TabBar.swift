//
//  TabBar.swift
//  AsaVax
//
//  Created by Thaynara da Silva Andrade on 23/11/23.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab = 0
    var body: some View {
        TabView (selection: $selectedTab) {
            ListaTarefasView(viewModel: .init())
                        .tabItem{
                            Image("Calendario")
                                
                       } .tag(0)
            ListaDeCards(viewModel: .init())
                        .tabItem{
                            Image(systemName: "clock")
                                
                                
                        } .tag(1)
                    
                }
            }
        }

#Preview {
    TabBar()
}
