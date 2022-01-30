//
//  WeatherServiceProtocol.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Moya
import RxCocoa
import RxSwift

protocol WeatherServiceProtocol {
    func getWeather(name: String) -> Observable<WeatherModel>
}
