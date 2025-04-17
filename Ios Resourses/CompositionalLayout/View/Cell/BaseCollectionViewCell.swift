//
//  BaseCollectionViewCell.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    class var cellIdentifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
