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
                            Image(.calendar)
                                .tint(selectedTab == 0 ? .primary100 : .gray)
                       } .tag(0)
            ListaDeCards(viewModel: .init())
                        .tabItem{
                            Image(.barn)
                                .tint(selectedTab == 1 ? .primary100 : .gray)
                                
                        } .tag(1)
                    
                }
            }
        }

#Preview {
    TabBar()
}
