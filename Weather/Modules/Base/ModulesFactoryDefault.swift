//
//  ModulesFactoryDefault.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation
import UIKit


final class ModulesFactoryDefault: ModulesFactory {
    

    private init() {}
    
    static let shared: ModulesFactory = ModulesFactoryDefault()
    
    func createMainPageModule() -> UIViewController {
        let view = MainPageViewController()
        let presenter = MainPagePresenter()
        let router = MainPageRouter()
        let navigationController = UINavigationController(rootViewController: view)
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.transitionHandler = view
        return navigationController
    }
    
    func createDetailWeatherPageModule(with model: WeatherModel) -> UIViewController {
        let view = DetailWeatherViewController()
        let presenter = DetailWeatherPresenter(viewModel: model)
        let router = DetailWeatherRouter()
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
}
