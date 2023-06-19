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
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
            CustomSliderView(currentValue: $currentValue, targetValue: targetValue, alpha: Float(computeScore()))
            Button("Проверь меня!") {
                showAlert = true
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 0.0
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
        return 100 - difference
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
