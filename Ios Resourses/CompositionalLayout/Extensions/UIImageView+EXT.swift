//
//  UIImageView+EXt.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

extension UIImageView {
    func makeRoundedImageView(cornerRedius: CGFloat = 8){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        clipsToBounds = true
        contentMode = .scaleAspectFill
        layer.cornerRadius = cornerRedius
    }
}
