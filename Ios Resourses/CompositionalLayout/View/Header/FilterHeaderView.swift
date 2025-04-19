//
//  FilterHeaderView.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 17/04/2025.
//

import UIKit
protocol FilterActionDelegate: AnyObject {
    func didfilterButtonTapped()
}
class FilterHeaderView: UICollectionReusableView {
    static let headerIdentifier = "FilterHeaderView"
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    
    weak var  delegate:FilterActionDelegate?
    
    lazy var allRestaurants: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .label.withAlphaComponent(0.8)
        l.text = "All restaurants".uppercased()
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return l
    }()
    
    lazy var filterBtn : UIButton =  {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Sort/Fiter", for: .normal)
        btn.setTitleColor(.label.withAlphaComponent(0.8), for: .normal)
        btn.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var divider: UIView = {
        let d = UIView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.backgroundColor = .secondaryLabel
        d.isHidden = true
        return d
    }()
    
    lazy var filterIcon: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "ic_setting")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .label.withAlphaComponent(0.8)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews([allRestaurants, filterBtn, filterIcon ,divider])
        backgroundColor = .systemBackground
        configureConsTrains()
    }
    
    private func configureConsTrains() {
        NSLayoutConstraint.activate([
            allRestaurants.centerYAnchor.constraint(equalTo: centerYAnchor),
            allRestaurants.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -10),
            
            filterBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.4),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            filterIcon.widthAnchor.constraint(equalToConstant: 25),
            filterIcon.heightAnchor.constraint(equalToConstant: 25),
            filterIcon.trailingAnchor.constraint(equalTo: filterBtn.leadingAnchor, constant: -3),
            filterIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        leadingConstraints = allRestaurants.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        leadingConstraints?.isActive = true

        trailingConstraints = filterBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2)
        trailingConstraints?.isActive = true
    }

    @objc func filterButtonTapped() {
        delegate?.didfilterButtonTapped()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
