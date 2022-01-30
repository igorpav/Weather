//
//  MainPageView.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import UIKit
import SnapKit

final class MainPageView: UIView {

    // MARK: - Appearance
    
    private struct Appearance: Grid {
        let size20: CGFloat = 20
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainPageTableViewCell.self, forCellReuseIdentifier: "reuseID")
        return tableView
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
    
    private func setupStyle() { }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
