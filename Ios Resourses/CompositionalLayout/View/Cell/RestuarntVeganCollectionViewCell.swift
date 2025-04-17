//
//  RestuarntVeganCollectionViewCell.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit

class RestuarntVeganCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RestuarntVeganCollectionViewCell"
    
    var cetData: VeganRestaurantModel? {
        didSet {
            guard let  cetData else {return}
            restaurantImage.image = UIImage(named: cetData.coverImage)
            title.text = cetData.restaurantName
            subtitle.text = cetData.categoryTags
        }
        }
    
    let restaurantImage:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    let title : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Resturant Name"
        label.textAlignment = .center
        label.textColor = UIColor.secondaryLabel.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView : UIView = {
        let d = UIView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.backgroundColor = .darkGray
        return d
    }()
    
    let subtitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "North India, Punjabi"
        l.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        l.textColor = .gray
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        addSubview(restaurantImage)
        addSubview(title)
        addSubview(dividerView)
        addSubview(subtitle)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print(self.frame.size.width)
        }
    }
    
    func configureConstrains() {
        NSLayoutConstraint.activate([
            restaurantImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantImage.heightAnchor.constraint(equalToConstant: 145),
            restaurantImage.topAnchor.constraint(equalTo: topAnchor),
            
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: restaurantImage.bottomAnchor, constant: 30),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 30),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 25),
            
            subtitle.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 15),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        ])
    }
}
