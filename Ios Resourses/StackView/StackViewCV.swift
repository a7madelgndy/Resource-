//
//  StackViewCV.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 22/04/2025.
//

import UIKit

class StackViewCV: UIViewController{
    
    var stackView = UIStackView()
    
    
    lazy var surveyButton: UIButton = {
        var b = UIButton()
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .red
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        b.layer.cornerRadius = 10
        return b
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
    }
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually //if i didn't set this (all button run together no spacing)
        stackView.spacing = 10
        //set Stack constrils
        addButtonToStackView()
        setStacViewContrains()
    }
    
    func addButtonToStackView() {
        for i in 1...5 {
            print(i)
            #warning("this is worng")
            let b = surveyButton
            b.setTitle( "\(i)" , for: .normal)
            stackView.addArrangedSubview(b)
        }
    }
    
    
    func setStacViewContrains() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -50).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
    }
    
    

}

#Preview() {
    StackViewCV()
}
