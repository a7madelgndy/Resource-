//
//  AppLayouts.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 14/04/2025.
//

import Foundation
import UIKit

class AppLayouts {
    static let shared = AppLayouts()
    
    func foodBannderSection()-> NSCollectionLayoutSection {
        //Item
        let itmesSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itmesSize)
        
        //group
        let groupSize = NSCollectionLayoutSize (widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

        return section
    }
    
}
#Preview {
    return FoodViewController()
}



