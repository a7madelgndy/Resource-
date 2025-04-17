//
//  VeganHeaderView.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

class VeganHeaderView: UICollectionReusableView {
    let titleLabel : UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.text = "vegetarain meals".uppercased()
        l.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return l
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configerTitle()
    }
    private func configerTitle() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
