//
//  DividerFooterView.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

class DividerFooterView: UICollectionReusableView {
    static let footerIdentifier = "DividerFooterView"
    
    lazy var footer: UIView = {
        let f = UIView()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.backgroundColor = .lightGray
        return f
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footer)
        setUpConstrains()
    }
    
    
    func setUpConstrains(){
        NSLayoutConstraint.activate([
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 2),
            footer.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
