//
//  DetailWeatherView.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation
import UIKit
import SDWebImage

private extension DetailWeatherView {
    struct Constants {
        static let stackLabelsColor = UIColor(red: 41/255, green: 42/255, blue: 48/255, alpha: 1)
    }
}

final class DetailWeatherView: UIView {
    
    // MARK: - Appearance
    
    private struct Appearance: Grid {
        let size30: CGFloat = 30
        let size20: CGFloat = 20
        let size150: CGFloat = 150
        let offset10: CGFloat = 10
        let offset20: CGFloat = 20
        let offset30: CGFloat = 30
        let offset50: CGFloat = 50
        let inset10: CGFloat = 10
        let inset20: CGFloat = 20
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.contentMode = .scaleAspectFit
        return weatherImageView
    }()
    
    lazy var nameCityLabel: UILabel = {
        let nameCityLabel = UILabel()
        nameCityLabel.font = UIFont.systemFont(ofSize: appearance.size30, weight: .semibold)
        nameCityLabel.textColor = .black
        return nameCityLabel
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: appearance.size30, weight: .semibold)
        temperatureLabel.textColor = .black
        return temperatureLabel
    }()
    
    lazy var nominationStackView: UIStackView = {
        let nominationStackView = UIStackView()
        nominationStackView.axis = .vertical
        return nominationStackView
    }()
    
    lazy var tempMaxLabel: UILabel = {
        let tempMaxLabel = UILabel()
        tempMaxLabel.textColor = Constants.stackLabelsColor
        tempMaxLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        tempMaxLabel.textAlignment = .right
        return tempMaxLabel
    }()
    
    lazy var tempMinLabel: UILabel = {
        let tempMinLabel = UILabel()
        tempMinLabel.textColor = Constants.stackLabelsColor
        tempMinLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        tempMinLabel.textAlignment = .right
        return tempMinLabel
    }()
    
    lazy var feelsLikeLabel: UILabel = {
        let feelsLikeLabel = UILabel()
        feelsLikeLabel.textColor = Constants.stackLabelsColor
        feelsLikeLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        feelsLikeLabel.textAlignment = .right
        return feelsLikeLabel
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.textColor = Constants.stackLabelsColor
        windSpeedLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        windSpeedLabel.textAlignment = .right
        return windSpeedLabel
    }()
    
    lazy var valuesStackView: UIStackView = {
        let valuesStackView = UIStackView()
        valuesStackView.axis = .vertical
        return valuesStackView
    }()
    
    lazy var tempMaxValueLabel: UILabel = {
        let tempMaxValueLabel = UILabel()
        tempMaxValueLabel.textColor = Constants.stackLabelsColor
        tempMaxValueLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        tempMaxValueLabel.textAlignment = .center
        return tempMaxValueLabel
    }()
    
    lazy var tempMinValueLabel: UILabel = {
        let tempMinValueLabel = UILabel()
        tempMinValueLabel.textColor = Constants.stackLabelsColor
        tempMinValueLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        tempMinValueLabel.textAlignment = .center
        return tempMinValueLabel
    }()
    
    lazy var feelsLikeValueLabel: UILabel = {
        let feelsLikeValueLabel = UILabel()
        feelsLikeValueLabel.textColor = Constants.stackLabelsColor
        feelsLikeValueLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        feelsLikeValueLabel.textAlignment = .center
        return feelsLikeValueLabel
    }()
    
    lazy var windSpeedValueLabel: UILabel = {
        let windSpeedValueLabel = UILabel()
        windSpeedValueLabel.textColor = Constants.stackLabelsColor
        windSpeedValueLabel.font = UIFont.systemFont(ofSize: appearance.size20, weight: .semibold)
        windSpeedValueLabel.textAlignment = .center
        return windSpeedValueLabel
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(weatherImageView)
        addSubview(nameCityLabel)
        addSubview(temperatureLabel)
        addSubview(nominationStackView)
        addSubview(valuesStackView)
        
        nominationStackView.addArrangedSubview(tempMaxLabel)
        nominationStackView.addArrangedSubview(tempMinLabel)
        nominationStackView.addArrangedSubview(feelsLikeLabel)
        nominationStackView.addArrangedSubview(windSpeedLabel)
        
        valuesStackView.addArrangedSubview(tempMaxValueLabel)
        valuesStackView.addArrangedSubview(tempMinValueLabel)
        valuesStackView.addArrangedSubview(feelsLikeValueLabel)
        valuesStackView.addArrangedSubview(windSpeedValueLabel)
    }
    
    private func makeConstraints() {
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.size.equalTo(appearance.size150)
        }
        
        nameCityLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImageView.snp.bottom).offset(appearance.offset20)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameCityLabel.snp.bottom).offset(appearance.offset10)
        }
        
        nominationStackView.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(appearance.offset50)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(appearance.offset10)
            make.trailing.equalTo(valuesStackView.snp.leading).inset(-appearance.inset20)
        }
        
        valuesStackView.snp.makeConstraints { make in
            make.top.equalTo(nominationStackView.snp.top)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(appearance.inset10)
            make.width.equalTo(nominationStackView.snp.width)
        }
    }
    
}

extension DetailWeatherView: Configurable {
    
    func configure(with viewModel: WeatherModel) {
        weatherImageView.image = UIImage(named: viewModel.weather.first!.icon)
        nameCityLabel.text = viewModel.name
        temperatureLabel.text = String(viewModel.main.temperature.convertTemperature()) + " ℃"
        tempMaxLabel.text = "Max. temperature:"
        tempMinLabel.text = "Min. temperature:"
        feelsLikeLabel.text = "Feels like:"
        windSpeedLabel.text = "Wind speed:"
        tempMaxValueLabel.text = String(viewModel.main.tempMax.convertTemperature()) + " ℃"
        tempMinValueLabel.text = String(viewModel.main.tempMin.convertTemperature()) + " ℃"
        feelsLikeValueLabel.text = String(viewModel.main.feelsLike.convertTemperature()) + " ℃"
        windSpeedValueLabel.text = (viewModel.wind.speed).toInt()!.description + " m/s"
    }
    
}
