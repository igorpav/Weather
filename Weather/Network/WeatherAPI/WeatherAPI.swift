//
//  WeatherAPI.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation
import Moya
import RxCocoa
import RxSwift
import SwiftyUserDefaults

enum WeatherAPI {
    case getWeather(name: String)
}

extension WeatherAPI: TargetType {
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case let .getWeather(name):
            return .requestParameters(
                parameters: ["q": name, "appid": "98343bedee2235a56728a10e256a044e"],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.openweathermap.org") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return "/data/2.5/weather"
        }
    }
    
}
