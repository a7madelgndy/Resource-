//
//  UIView + EXT.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 14/04/2025.
//

import UIKit

extension UIView {
    
    func pinToEages(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
}
