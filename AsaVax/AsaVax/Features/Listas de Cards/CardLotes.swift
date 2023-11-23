//
//  CardLotes.swift
//  AsaVax
//
//  Created by Marília de Sousa on 23/11/23.
//

import SwiftUI

struct CardLotes: View {
    
    let loteTitle: String
    let loteTitle2: String
    let loteTitle3: String
    let loteImage: Image
    let loteImage2: Image
    
    
    init(loteTitle: String, loteTitle2: String, loteTitle3: String, loteImage: Image, loteImage2: Image) {
        self.loteTitle = loteTitle
        self.loteTitle2 = loteTitle2
        self.loteTitle3 = loteTitle3
        self.loteImage = loteImage
        self.loteImage2 = loteImage2
        
    }
    
    var body: some View {
        Form {
            ZStack (alignment: .trailing){
                HStack {
                    loteImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    
                    VStack(alignment: .leading){
                        
                        Text(loteTitle)
                            .font(.title3)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .padding(.trailing)
                        
                        Text(loteTitle2)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                        
                    }
                    Spacer()
                    ZStack {
                        HStack {
                            Text(loteTitle3)
                                .multilineTextAlignment(.trailing)
                            //    .padding(.trailing)
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                            
                            
                            loteImage2
                            
                                .frame(width: 24, height: 24)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CardLotes(loteTitle: "Lote 01", loteTitle2 :"200 galinhas", loteTitle3: "24/09/22", loteImage: Image("galinha1"), loteImage2: Image("flecha"))
}
