//
//  BaseView.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation
import UIKit
import SnapKit

class BaseView: UIView {
    
    // MARK: - Internal properties

    let contentView = UIView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeDefaultConstraints(in viewController: UIViewController) {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
