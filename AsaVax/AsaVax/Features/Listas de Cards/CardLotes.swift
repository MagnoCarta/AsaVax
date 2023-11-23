//
//  CardLotes.swift
//  AsaVax
//
//  Created by Marília de Sousa on 23/11/23.
//

import SwiftUI

struct CardLotes: View {
    
    let lote: Batch
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
            .foregroundStyle(.neutral700)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .overlay {
                HStack {
                    Image(.galinha1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .padding()
                    
                    
                    VStack(alignment: .leading){
                        
                        Text(lote.name)
                            .font(.custom("Inter", size: 16))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.neutral50)
                            .padding(.trailing)
                        
                        Text("\(lote.numberBought) galinhas")
                            .font(.custom("Inter-SemiBold", size: 14))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.neutral50)
                        
                    }
                    Spacer()
                    HStack {
                        Text(lote.date.dateStringISOFormat())
                            .font(.custom("Inter-SemiBold", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.neutral50)
                        
                        Image(.flecha)
                        
                            .frame(width: 24, height: 24)
                    }
                    .padding(.trailing)
                }
            }
    }
}

#Preview {
    CardLotes(lote: .init(name: "Lote X", date: .now, numberBought: "200", vaxDone: "5", medicineApplied: "6", tipo: .corte, genero: .femea))
}
