//
//  DetailWeatherPresenter.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation

final class DetailWeatherPresenter {
    
    // MARK: - Private properties
    
    private var model: WeatherModel
    
    // MARK: - Internal properties
    
    weak var view: DetailWeatherViewInput?
    var router: DetailWeatherRouterInput?

    // MARK: - Init
    
    init(viewModel: WeatherModel) {
        self.model = viewModel
    }
    
}

extension DetailWeatherPresenter: DetailWeatherViewOutput {
    
    var weatherModel: WeatherModel {
        get {
            model
        }
    }
    
}


