//
//  CustomSliderView.swift
//  sliderApp
//
//  Created by Константин Натаров on 19.06.2023.
//

import SwiftUI

struct CustomSliderView: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let alpha: Float
    
    var body: some View {
        HStack {
            Text("0")
            CustomUISlider(currentValue: $currentValue, alpha: alpha)
            Text("100")
        }
        .padding()
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(currentValue: .constant(0.5), targetValue: 50, alpha: 0.3)
    }
}
