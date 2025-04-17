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
        
        cv.register(FilterHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: FilterHeaderView.headerIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
        
        setUpNavigation()
        configureConstrains()
        configureCompoitionalLayou()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(navigationView)
        view.addSubview(collectionView)
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
}

//MARK: Ext
extension FoodViewController {
    func configureCompoitionalLayou() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex,  enviorment in
            switch sectionIndex {
            case 0 : return AppLayouts.shared.foodBannderSection()
            case 1 : return AppLayouts.shared.foodCategorySection()
            default : return AppLayouts.shared.restaurantListSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}


extension FoodViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 : foodTopBannerMockData.count
        case 1: foodCategoryMockData.count
        default: restaurantListMockData.count
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
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
        default :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantListCollectionViewCell.cellIdentifier, for: indexPath) as? RestaurantListCollectionViewCell else {
                fatalError("Unable deue cell..")
            }
            cell.cellData = restaurantListMockData[indexPath.row]
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            switch indexPath.section {
            default :
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FilterHeaderView.headerIdentifier, for: indexPath) as! FilterHeaderView
                return header
                
            }
        }
        
        return UICollectionReusableView()
  
    }
}
#Preview {
    FoodViewController()
}
