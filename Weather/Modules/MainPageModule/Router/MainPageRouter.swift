//
//  MainPageRouter.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation

final class MainPageRouter {
    
    // MARK: - Internal properties
    
    weak var transitionHandler: MainPageTransitionHandler?
    weak var moduleInput: MainPageModuleOutput?
    
}

extension MainPageRouter: MainPageRouterInput {
    
    func showDetailWeatherModule(viewModel: WeatherModel) {
        let controller = ModulesFactoryDefault.shared.createDetailWeatherPageModule(with: viewModel)
        transitionHandler?.show(controller)
    }

}
