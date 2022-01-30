//
//  ModulesFactory.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation
import UIKit

protocol ModulesFactory {
    
    // MARK: - Main Page
    
    func createMainPageModule() -> UIViewController
    
    // MARK: - Detail Weather Page
    
    func createDetailWeatherPageModule(with model: WeatherModel) -> UIViewController
    
}
