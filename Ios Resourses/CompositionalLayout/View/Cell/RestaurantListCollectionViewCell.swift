//
//  RestaurantListCollectionViewCell.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 16/04/2025.
//

import UIKit

class RestaurantListCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RestaurantListCollectionViewCell"
    var cellData:RestaurantListModel? {
        didset{
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
