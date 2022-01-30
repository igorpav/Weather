//
//  Configurable.swift
//  Weather
//
//  Created by Игорь Павличенков on 28.01.2022.
//

import Foundation

import UIKit

protocol Configurable where Self: UIView {
    
    associatedtype ViewModel
    
    func configure(with viewModel: ViewModel)
    
}
