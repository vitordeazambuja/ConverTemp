import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedUnit: Double {
        var temperaturaFinal: Double
        switch inputUnit {
            
        case "Celsius":
            if outputUnit == "Fahrenheit" {
                temperaturaFinal = (inputNumber * 9/5) + 32
                return temperaturaFinal
            } else if outputUnit == "Kelvin" {
                temperaturaFinal = inputNumber + 273.15
                return temperaturaFinal
            } else {
                return inputNumber
            }
            
        case "Fahrenheit":
            if outputUnit == "Celsius" {
                temperaturaFinal = (inputNumber - 32) * 5/9
                return temperaturaFinal
            } else if outputUnit == "Kelvin" {
                temperaturaFinal = (inputNumber-32) * 5/9 + 273.15
                return temperaturaFinal
            } else {
                return inputNumber
            }
            
        case "Kelvin":
            if outputUnit == "Celsius" {
                temperaturaFinal = inputNumber - 273.15
                return temperaturaFinal
            } else if outputUnit == "Fahrenheit" {
                temperaturaFinal = 1.8 * (inputNumber - 273) + 32
                return temperaturaFinal
            } else {
                return inputNumber
            }
            
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Input
                Section("Enter a number and a unit") {
                    TextField("Input Number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // Output
                Section("Select the output unit") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(String(format: "%.2f", convertedUnit) + " \(outputUnit)")

                }
            }
            .navigationTitle("ConverTemp")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
