//
//  ContentView.swift
//  ConverTemp
//
//  Created by Vitor de Azambuja on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var body: some View {
        NavigationStack{
            Form{
                // Input
                Section("Enter a number and a unit"){
                    TextField("Input Number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                
                // Output
                Section("Select the output unit"){
                    Picker("Input Unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
            }.navigationTitle("ConverTemp")
        }
    }
}

#Preview {
    ContentView()
}
