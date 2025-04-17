//
//  SectionDecorationView.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 14/04/2025.
//

import UIKit

class SectionDecorationView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    func setUpViews(){
        self.backgroundColor = .lightGray.withAlphaComponent(0.2)
        layer.cornerRadius = 20
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

