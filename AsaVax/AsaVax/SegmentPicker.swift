//
//  SegmentPicker.swift
//  AsaVax
//
//  Created by Thaynara da Silva Andrade on 23/11/23.
//

import SwiftUI

struct SegmentPicker: View {
    @State var selected = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .init(named:("VerdeEscuro"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        Picker(selection: $selected, label: Text("Picker"), content: {
            Text("Dia").tag(0)
            Text("Semana").tag(1)
            Text("Mês").tag(2)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    SegmentPicker()
}
