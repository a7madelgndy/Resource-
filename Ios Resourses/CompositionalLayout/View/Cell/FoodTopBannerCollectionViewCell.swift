//
//  FoodTopBannerCollectionViewCell.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 14/04/2025.
//

import UIKit

class FoodTopBannerCollectionViewCell: BaseCollectionViewCell {
    
    var cellData : FoodTopBannerModel? {
        didSet {
            guard let cellData = cellData else {return}
            bannerImage.image = UIImage(named: cellData.image)
        }
    }
    
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.applyShadow()
        return shadowView
    }()
    
    
    let bannerImage : UIImageView = {
        let bI = UIImageView()
        bI.makeRoundedImageView()
        return bI
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    func configure(){
        contentView.backgroundColor = .clear
        addSubview(shadowView)
        shadowView.addSubview(bannerImage)
        shadowView.pinToEages(to: self)
        bannerImage.pinToEages(to: shadowView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

