//
//  BacisCompotionlayout.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 14/04/2025.
//

import UIKit

class BasicCompositionLayout: UIViewController {
    let collectionView  = UICollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCompositionalLayout()
        
    }
    func configureCompositionalLayout() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinToEages(to: view)
        collectionView.backgroundColor = .tertiaryLabel
        
        
    }
}
//MARK: Comositional Layout
extension BasicCompositionLayout {
    func configureCompoitionalLayout() {
        
        //item / item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group / group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(255))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        //Create seaction
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        
        //Creat Compositional layout
        let layout = UICollectionViewCompositionalLayout{sectionIndex , enviroment in
            switch sectionIndex {
            case 0 :section
            default : section
            }
        }
        
        //add layout to collection view
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}
//MARK: Collection View
extension BasicCompositionLayout: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        default:
            5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        default: break
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: , for: <#T##IndexPath#>)
        }
    }
    
    
}
