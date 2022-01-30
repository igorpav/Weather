//
//  DetailWeatherViewController.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import UIKit

final class DetailWeatherViewController: BaseViewController {

    // MARK: - Private properties
   
    private let detailWeatherView = DetailWeatherView()
    
    // MARK: - Internal properties
    
    var presenter: DetailWeatherViewOutput?
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return detailWeatherView
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let model = presenter?.weatherModel else { return }
        detailWeatherView.configure(with: model)
    }

}

extension DetailWeatherViewController: DetailWeatherViewInput { }
