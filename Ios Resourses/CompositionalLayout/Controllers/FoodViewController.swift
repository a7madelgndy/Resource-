//
//  CompositionalLayoutViewController.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 13/04/2025.
//

import UIKit

class FoodViewController: UIViewController {
    
    //MARK: Properties
    var navigationView : UIView = {
        let nv = UIView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.backgroundColor = .systemBackground
        return nv
    }()
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.dataSource = self
        cv.delegate = self
        cv.register(FoodTopBannerCollectionViewCell.self, forCellWithReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier)
        cv.register(FoodCategoryCollectionViewCell.self, forCellWithReuseIdentifier: FoodCategoryCollectionViewCell.cellIdentifier)
        cv.register(RestaurantListCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantListCollectionViewCell.cellIdentifier)
        cv.register(RestuarntVeganCollectionViewCell.self, forCellWithReuseIdentifier: RestuarntVeganCollectionViewCell.cellIdentifier)
        
        cv.register(FilterHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FilterHeaderView.headerIdentifier)
        
        cv.register(DividerFooterView.self, forSupplementaryViewOfKind: "Footer", withReuseIdentifier: DividerFooterView.footerIdentifier)
        cv.register(VeganHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: VeganHeaderView.Identifier)
        
        return cv
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpNavigation()
        configureConstrains()
        configureCompoitionalLayou()
    }
    
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews([navigationView , collectionView])
    }
    
    
    private func setUpNavigation() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = false
        
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 70, height: 30)
        btn.setButtonTitleWithRightImage(title: "Home", btnImage: "ic_arrow_down", customFont: UIFont.systemFont(ofSize: 20,weight: .bold), color: .label, imageColor: .label, imageSize: 20)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
    
    
    func configureConstrains() {
        collectionView.pinToEages(to: view)
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            navigationView.heightAnchor.constraint(equalToConstant: 64)
            
            
        ])
    }
    
    
    func configureCompoitionalLayou() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex,  enviorment in
            switch sectionIndex {
            case 0 : return AppLayouts.shared.foodBannderSection()
            case 1 : return AppLayouts.shared.foodCategorySection()
            case 2 : return AppLayouts.shared.restaurantListSection()
            default : return
                AppLayouts.shared.restaurantVeganSection()
            }
        }
        layout.register(SeactionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}



extension FoodViewController: FilterActionDelegate {
    func didfilterButtonTapped() {
        print("Open Filter")
    }
}

#Preview {
    return FoodViewController()
}
