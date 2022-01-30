//
//  MainPageTableViewCell.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import UIKit
import SnapKit

private extension MainPageTableViewCell {
    struct Constants {
        static let celsius = " ℃"
        
    }
}

final class MainPageTableViewCell: UITableViewCell {

    // MARK: - Appearance

    private struct Appearance: Grid {
        let offset20: CGFloat = 20
        let inset30: CGFloat = 30
        let inset20: CGFloat = 20
        let inset15: CGFloat = 15
        let inset10: CGFloat = 10
        let fontSize20: CGFloat = 20
        let fontSize15: CGFloat = 15
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var nameCityLabel: UILabel = {
        let nameCityLabel = UILabel()
        nameCityLabel.font = UIFont.systemFont(ofSize: appearance.fontSize20, weight: .semibold)
        nameCityLabel.textColor = .black
        return nameCityLabel
    }()
    
    lazy var weatherLabel: UILabel = {  
        let weatherLabel = UILabel()
        weatherLabel.font = UIFont.systemFont(ofSize: appearance.fontSize15, weight: .light)
        weatherLabel.textColor = .lightGray
        return weatherLabel
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: appearance.fontSize20, weight: .semibold)
        temperatureLabel.textColor = .black
        return temperatureLabel
    }()
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(nameCityLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(temperatureLabel)
    }

    private func makeConstraints() {
        nameCityLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(appearance.offset20)
            make.bottom.equalToSuperview().inset(appearance.inset20)
            make.trailing.equalTo(weatherLabel.snp.leading).inset(appearance.inset30)
        }
        weatherLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameCityLabel)
            make.trailing.equalTo(temperatureLabel.snp.leading).inset(-appearance.inset15)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalTo(weatherLabel)
            make.trailing.equalToSuperview().inset(appearance.inset20)
        }
    }

}

extension MainPageTableViewCell: Configurable {
    
    func configure(with viewModel: WeatherModel) {
        nameCityLabel.text = viewModel.name
        weatherLabel.text = viewModel.weather.first?.description
        temperatureLabel.text = String(viewModel.main.temperature.convertTemperature()) + Constants.celsius
    }
    
}
