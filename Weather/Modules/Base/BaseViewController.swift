//
//  BaseViewController.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import RxCocoa
import RxSwift
import SnapKit
import SwiftyUserDefaults
import UIKit

class BaseViewController: UIViewController {

    // MARK: - Private properties

    private let baseView = BaseView()

    // MARK: - Internal properties

    let disposeBag = DisposeBag()

    var customView: UIView {
        return UIView()
    }

    var prefersNavigationBarHidden: Bool {
        return false
    }

    // MARK: - Lify cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(prefersNavigationBarHidden, animated: animated)
        configureNavigationItem(for: super.navigationItem)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    override func loadView() {
        view = baseView
        view.backgroundColor = .clear
        baseView.makeDefaultConstraints(in: self)
        baseView.contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(false)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard #available(iOS 13.0, *),
            traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        setupStyle()
        reloadViewAfterChangeMode()
    }

    // MARK: - Private methods

    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard(_:))
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    private func configureNavigationItem(for navigationItem: UINavigationItem) {
        setupStyle()
    }

    func setupStyle() {
        var showBorderByDefault: Bool
        if #available(iOS 15.0, *) {
            showBorderByDefault = false
        } else {
            showBorderByDefault = true
        }
    }
    
    // MARK: - Internal methods
    
    func removeBottomSafeArea() {
        customView.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func reloadViewAfterChangeMode() { }

    // MARK: - Action handlers

    @objc
    func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        if let navigationController = self.navigationController {
            navigationController.view.endEditing(true)
        }
    }

}

