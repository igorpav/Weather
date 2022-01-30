//
//  ViewController.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import UIKit
import RxSwift

final class MainPageViewController: BaseViewController, MainPageTransitionHandler {
    
    // MARK: - Private properties
    
    private let mainPageView = MainPageView()
    private let weatherService = WeatherService()
    
    // MARK: - Public properties
    
    var presenter: MainPageViewOutput?

    // MARK: - Override properties
    
    override var customView: UIView {
        return mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupPlusButton()
        setupSortButton()
        presenter?.fillingModels()
   }

    // MARK: - Private methods
    
    private func setupPlusButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWeather))
        button.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupSortButton() {
        let nameAscendingSortItem = UIAction(title: "Sort by name (A-Z)") { _ in
            self.presenter?.sortArray(by: .nameAscendingSort)
        }
        let nameDescendingSortItem = UIAction(title: "Sort by name (Z-A)") { _ in
            self.presenter?.sortArray(by: .nameDescendingSort)
        }
        let tempAscendingSortItem = UIAction(title: "Sort ascending by temperature") { _ in
            self.presenter?.sortArray(by: .tempAscendingSort)
        }
        let tempDescendingSortItem = UIAction(title: "Sort descending by temperature") { _ in
            self.presenter?.sortArray(by: .nameDescendingSort)
        }
        let menu = UIMenu(title: "Select sort type", options: .displayInline, children: [nameAscendingSortItem, nameDescendingSortItem, tempAscendingSortItem, tempDescendingSortItem])
        let button = UIBarButtonItem(title: "⇅", menu: menu)
        navigationItem.leftBarButtonItem = button
    }
    
    private func setupDelegates() {
        mainPageView.tableView.delegate = self
        mainPageView.tableView.dataSource = self
    }
    
    // MARK: - Action handlers
    
    @objc
    private func addWeather() {
        configureAlert(with: "City", placeholder: "Enter city name")
    }
    
    @objc
    private func sortArray() { }
    
}

// MARK: - UITableView

extension MainPageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.weatherModels.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseID", for: indexPath) as! MainPageTableViewCell
        let city = presenter?.weatherModels[indexPath.row]
        if let city = city {
            cell.configure(with: city)
        }
        return cell
    }
    
}

extension MainPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let model = presenter?.weatherModels[indexPath.row] {
            presenter?.showDetailWeatherModule(model: model)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletedAction = UIContextualAction(style: .destructive, title: "Delete") { [self] _, _, completionHandler in
            presenter?.removeModel(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return UISwipeActionsConfiguration(actions: [deletedAction])
    }
    
}

extension MainPageViewController: MainPageViewInput {
    
    func reloadData() {
        mainPageView.tableView.reloadData()
    }
    
    func present(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(actionOK)
        present(alert, animated: true, completion: nil)
    }
    
}

extension MainPageViewController {
    
    func configureAlert(with city: String, placeholder: String) {
        let alertController = UIAlertController(title: city, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "OK", style: .default) { (action) in
            let textFieldtext = alertController.textFields?.first
            guard let text = textFieldtext?.text else { return }
            self.presenter?.addWeather(by: text)
        }
        alertController.addTextField { textField in
            textField.placeholder = placeholder
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
    }
    
}
