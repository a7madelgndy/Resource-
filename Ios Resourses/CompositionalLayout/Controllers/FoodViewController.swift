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
            default:
                return AppLayouts.shared.foodBannderSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}


extension FoodViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        default: foodTopBannerMockData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
         default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodTopBannerCollectionViewCell.cellIdentifier, for: indexPath) as? FoodTopBannerCollectionViewCell else {
                fatalError("Unable deque cell...")
            }
            cell.cellData = foodTopBannerMockData[indexPath.row]
            return cell
        }
 
    }
    
    
}

