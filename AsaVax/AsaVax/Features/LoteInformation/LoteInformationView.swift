//
//  LoteInformationView.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import SwiftUI

struct LoteInformationView: View {
    
    var price: Price
    var lote: Batch
    @State var isSheeting: Bool = false
    
    var body: some View {
        ZStack {
            Color.neutral800.ignoresSafeArea()
            VStack {
                Image(.galinha1)
                VStack {
                    row(Image(.silo), "Número de Animais", price.quantidade)
                    row(Image(.dollar), "Custo por cabeça", String(price.custoUnitario))
                    row(Image(.dollar), "Custo Total", String(price.custoTotal))
                    row(Image(.genderFemale), "Gênero", price.genero.rawValue)
                    row(Image(.chart), "Tipo de produção", price.tipo.rawValue)
                    row(Image(.calendar), "Data da compra", price.dataCompra.dateStringISOFormat())
                }
                HStack(alignment: .center) {
                    Text("Lucro Estimado")
                        .font(Font.custom("Inter", size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(.neutral50)
                    Image(.helpCircle)
                }
                Text("+R$ \(price.lucro),00")
                    .font(.custom("Inter", size: 28))
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary100)
                Spacer()
            }
            .navigationTitle(price.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Text("Editar")
                        .foregroundStyle(.primary100)
                        .onTapGesture {
                            self.isSheeting = true
                        }
                })
            }
            .sheet(isPresented: $isSheeting, content: {
                CadastroView(viewModel: .init(batch: lote))
            })
        }
    }
    
    func row(_ icon: Image,_ name: String,_ info: String) -> some View {
        VStack {
            HStack {
                icon
                Text(name)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundStyle(.neutral50)
                Spacer()
                Text(info)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundStyle(.neutral50)
            }
            Divider()
        }
    }
}


struct Price {
    
    var name: String
    var quantidade: String
    var custoUnitario: Int = 70
    var custoTotal: Int { custoUnitario * (Int(quantidade) ?? 100) }
    var genero: Genero
    var tipo: TipoDoLote
    var dataCompra: Date
    var lucro: Int {  (50*(Int(quantidade) ?? 100)) + custoTotal   }
    
    init(lote: Batch) {
        self.name = lote.name
        self.quantidade = lote.numberBought
        self.genero = lote.genero
        self.tipo = lote.tipo
        self.dataCompra = lote.date
    }
    
}
