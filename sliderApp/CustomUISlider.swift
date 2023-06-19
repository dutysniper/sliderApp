//
//  UISliderRepresentation.swift
//  sliderApp
//
//  Created by Константин Натаров on 19.06.2023.
//

import SwiftUI

struct CustomUISlider: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let alpha: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue(sender:)),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor =  UIColor(
            red: 0,
            green: 0,
            blue: 1,
            alpha: CGFloat(alpha / 100)
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

// MARK: - Coordinator
extension CustomUISlider {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func changeSliderValue(sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        CustomUISlider(currentValue: .constant(0.3), alpha: 0.5)
    }
}
