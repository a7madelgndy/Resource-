//
//  UICollectionView+EXT.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

extension UICollectionView {

    func registerCells(_ cellTypes: [BaseCollectionViewCell.Type]) {
        cellTypes.forEach {
            self.register($0.self, forCellWithReuseIdentifier: BaseCollectionViewCell.cellIdentifier)
        }
    }

}
