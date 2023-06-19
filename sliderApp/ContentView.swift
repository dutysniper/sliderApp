//
//  ContentView.swift
//  sliderApp
//
//  Created by Константин Натаров on 19.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к 00")
            CustomSliderView(currentValue: $currentValue, targetValue: targetValue, alpha: Float(computeScore()))
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Your score"),
                    message: Text("\(computeScore())"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        print("target: \(targetValue)")
        print("разница \(difference)")
        return 100 - difference
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
