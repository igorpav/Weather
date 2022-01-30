//
//  DetailWeatherModule.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation

/// Presenter -> View
protocol DetailWeatherViewInput: AnyObject { }

/// View -> Presenter
protocol DetailWeatherViewOutput {
    var weatherModel: WeatherModel { get }
}

/// Presenter -> Router
protocol DetailWeatherRouterInput { }

protocol DetailWeatherModuleOutput: AnyObject { }
