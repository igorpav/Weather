//
//  MainPagePresenter.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation
import RxSwift
import UIKit

enum SortingTypes {
    
    case nameAscendingSort
    case nameDescendingSort
    case tempAscendingSort
    case tempDescendingSort
    
}

private extension MainPagePresenter {
    struct Constants {
        static let errorCityAlreadyExists = "This city already exists"
        static let errorIncorrectCity = "The name of the city is entered incorrectly. Try again"
    }
}

final class MainPagePresenter {
    
    // MARK: - Private properties
    
    private var weatherService = WeatherService()
    private var models: WeatherModels = []
    
    // MARK: - Public properties
    
    weak var view: MainPageViewInput?
    var router: MainPageRouterInput?
    let disposeBag = DisposeBag()
    
}

extension MainPagePresenter: MainPageViewOutput {
    
    var weatherModels: [WeatherModel] {
        get {
            models
        }
        set {
            models = newValue
        }
    }
    
    func sortArray(by type: SortingTypes) {
        switch type {
        case .nameAscendingSort:
            models.sort(by: { $0.name < $1.name })
        case .nameDescendingSort:
            models.sort(by: { $0.name > $1.name })
        case .tempAscendingSort:
            models.sort(by: { $0.main.temperature < $1.main.temperature })
        case .tempDescendingSort:
            models.sort(by: { $0.main.temperature > $1.main.temperature })
        }
        print(models.map({ $0.main.temperature }))
        view?.reloadData()
    }
    
    func addWeather(by name: String) {
        if models.map({ $0.name.lowercased() }).contains(name.lowercased()) {
            DispatchQueue.main.async {
                self.view?.present(error: Constants.errorCityAlreadyExists)
            }
            return
        }
        weatherService.getWeather(name: name).subscribe { [weak self] response in
            guard let self = self else { return }
            self.models.append(response)
            self.view?.reloadData()
        } onError: { [weak self] error in
            guard self != nil else { return }
            self?.view?.present(error: Constants.errorIncorrectCity)
        }.disposed(by: disposeBag)
    }
    
    func removeModel(at index: Int) {
        models.remove(at: index)
    }
    
    func showDetailWeatherModule(model: WeatherModel) {
        router?.showDetailWeatherModule(viewModel: model)
    }
    
    func fillingModels() {
        let startCities: [String] = ["Kazan", "Moscow", "Dubai"]
        for city in startCities {
            weatherService.getWeather(name: city).subscribe { [weak self] response in
                guard let self = self else { return }
                self.models.append(response)
                self.view?.reloadData()
            } onError: { [weak self] error in
                guard self != nil else { return }
            }.disposed(by: disposeBag)
        }
    }
    
}
