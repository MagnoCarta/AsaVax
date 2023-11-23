//
//  Atividades.swift
//  AsaVax
//
//  Created by Thaynara da Silva Andrade on 23/11/23.
//

import SwiftUI

struct Atividades: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                
                //Inserir aqui o dia da semana e período + botão de adicionar
            }
            
            SegmentPicker()
                .padding()
            Text("Atividades pendentes")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            
            ScrollView{
                
                //Inserir aqui o componente quando adicionado
                
                
                Text("Atividades concluídas")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(.leading)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                //Inserir aqui o componente quando marcado concluído
                
                
            }
            
            //Touch Bar
            
        } .background(Color("Background"))
    }
}

#Preview {
    Atividades()
}
