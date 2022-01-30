//
//  BaseTransitionHandler.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation
import UIKit

protocol BaseTransitionHandler: AnyObject {
    func show(_ viewController: UIViewController)
    func present(_ viewController: UIViewController)
    func fullScreenPresent(_ viewController: UIViewController)
    func popViewControllerWithAnimated()
    func popViewControllerWithAnimated(completion: (() -> Void)?)
    func popToViewController(_ controller: UIViewController)
    func dismiss()
    func dismiss(completion: (() -> Void)?)
}

extension UIViewController: BaseTransitionHandler {
   
    @objc
    func show(_ viewController: UIViewController) {
        show(viewController, sender: self)
    }

    @objc
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }

    @objc
    func popViewControllerWithAnimated() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    func popViewControllerWithAnimated(completion: (() -> Void)?) {
        navigationController?.popViewController(animated: true)
        
        if let coordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion?()
            }
        }
    }
    
    @objc
    func popToViewController(_ controller: UIViewController) {
        navigationController?.popToViewController(controller, animated: true)
    }

    @objc
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    @objc
    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }

    @objc
    func fullScreenPresent(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

}
