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
    
    func setGradient(withColors colors: [CGColor] , startPoint: CGPoint , endPoint: CGPoint) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyShadow(
            cornerRadius: CGFloat = 8,
            borderWidth: CGFloat = 0.6,
            borderColor: UIColor = UIColor.gray.withAlphaComponent(0.3),
            shadowColor: UIColor = UIColor.label.withAlphaComponent(0.4),
            shadowOffset: CGSize = CGSize(width: 0, height: 4),
            shadowOpacity: Float = 1,
            shadowRadius: CGFloat = 5
        ) {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowRadius = shadowRadius
            self.backgroundColor = .clear
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    
    func addSubviews(_ views:[UIView]) {
        views.forEach{addSubview($0)}
    }
}

