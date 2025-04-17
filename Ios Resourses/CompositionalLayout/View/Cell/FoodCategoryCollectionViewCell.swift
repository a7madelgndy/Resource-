//
//  FoodCategoryCollectionViewCell.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 15/04/2025.
//

import UIKit

class FoodCategoryCollectionViewCell: BaseCollectionViewCell {
  
    private var categoryImageView = UIImageView()
    private var categorytitlelabe = UILabel()
    
    
    var cellData: FoodCategoryModel? {
        didSet {
            guard let cellData else {return}
            categoryImageView.image = UIImage(named: cellData.categoryImage)
            categorytitlelabe.text = cellData.categoryName
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    
    private func configureUI() {
        addSubviews([categoryImageView , categorytitlelabe])
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.layer.cornerRadius = 3
        categoryImageView.clipsToBounds = true
        categoryImageView.contentMode = .scaleAspectFit

        categorytitlelabe.translatesAutoresizingMaskIntoConstraints = false
        categorytitlelabe.font = UIFont.systemFont(ofSize: 10, weight: .light)
        categorytitlelabe.numberOfLines = 2
        categorytitlelabe.textAlignment = .center
        categorytitlelabe.textColor = .label.withAlphaComponent(0.8)
        
        NSLayoutConstraint.activate([
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 3),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            categoryImageView.heightAnchor.constraint(equalToConstant: 45),
            
            categorytitlelabe.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 3),
            categorytitlelabe.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            categorytitlelabe.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 3),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
