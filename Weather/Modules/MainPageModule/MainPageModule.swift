//
//  MainPageModule.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation
import UIKit

/// Presenter -> View
protocol MainPageViewInput: AnyObject {
    func reloadData()
    func present(error: String)
}

/// View -> Presenter
protocol MainPageViewOutput {
    var weatherModels: [WeatherModel] { get set }
    func fillingModels()
    func showDetailWeatherModule(model: WeatherModel)
    func removeModel(at index: Int)
    func addWeather(by name: String)
    func sortArray(by type: SortingTypes)
}

/// Presenter -> Router
protocol MainPageRouterInput {
    func showDetailWeatherModule(viewModel: WeatherModel)
}

protocol MainPageTransitionHandler: BaseTransitionHandler { }

protocol MainPageModuleOutput: AnyObject { }
