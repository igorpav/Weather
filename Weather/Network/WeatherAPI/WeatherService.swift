//
//  WeatherService.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Moya
import Result
import RxCocoa
import RxSwift

class WeatherService: WeatherServiceProtocol {
    
    var provider = MoyaProvider<WeatherAPI>()
    
    func getWeather(name: String) -> Observable<WeatherModel> {
        
        return provider.rx
            .request(.getWeather(name: name))
            .filterSuccessfulStatusCodes()
            .map(WeatherModel.self)
            .asObservable()
    }
    
}
