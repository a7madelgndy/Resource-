//
//  CoredataVC.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 20/04/2025.
//

import UIKit
import CoreData



class CoredataVC: UIViewController {
    var coredata: CoredataManager?
    
    lazy var textFiled : UITextField = {
        var tf = UITextField()
        tf.delegate = self
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .black
        tf.returnKeyType = .done
        tf.layer.borderWidth = 1
        return tf
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        coredata = CoredataManager.shared
        coredata?.save(movieTitle: "c", movieRating: 7.5)
        print(coredata?.getMovies())
    }
    
}

#Preview()  {
    CoredataVC()
}

extension  CoredataVC {
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(textFiled)
        textFiled.setCenterX(inView: view)
        textFiled.setCenterY(inView: view)
        textFiled.setHeight(height: 40)
        textFiled.setWidth(width: 200)
    
    }
}

extension CoredataVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFiled.resignFirstResponder()
        print(textField.text ?? " ")
        return true
    }
}
