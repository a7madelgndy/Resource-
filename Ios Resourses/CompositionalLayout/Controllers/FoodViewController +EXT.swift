//
//  FoodViewController +EXT.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit
extension FoodViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 : foodTopBannerMockData.count
        case 1: foodCategoryMockData.count
        case 2: restaurantListMockData.count
        default : veganRestaurantMockData.count
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? FoodTopBannerCollectionViewCell else {
                fatalError("Unable deque cell...")
            }
            cell.cellData = foodTopBannerMockData[indexPath.row]
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? FoodCategoryCollectionViewCell else {
                fatalError("Unable deue cell..")
            }
            cell.cellData = foodCategoryMockData[indexPath.row]
            return cell
        case 2 :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantListCollectionViewCell.cellIdentifier, for: indexPath) as? RestaurantListCollectionViewCell else {
                fatalError("Unable deue cell..")
            }
            cell.cellData = restaurantListMockData[indexPath.row]
            return cell
        default :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestuarntVeganCollectionViewCell.cellIdentifier, for: indexPath) as? RestuarntVeganCollectionViewCell else {
                fatalError("Unable deue cell..")
            }
            cell.cetData = veganRestaurantMockData[indexPath.row]
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == "Header" {
            switch indexPath.section {
            case 2 :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.headerIdentifier, for: indexPath) as!
                FilterHeaderView
                header.delegate = self
                return header
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: VeganHeaderView.Identifier, for: indexPath) as! VeganHeaderView
                return header
            }
            
        }else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: "Footer", withReuseIdentifier: DividerFooterView.footerIdentifier, for: indexPath) as! DividerFooterView
            return footer
        }
    }
}
