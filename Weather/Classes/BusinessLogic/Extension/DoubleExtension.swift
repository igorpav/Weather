//
//  DoubleExtension.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation

extension Double {

    func convertTemperature() -> Int {
        let celsius: Int = (Int)(self - 273)
        return celsius
    }
    
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
    
}
