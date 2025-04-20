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
    override func viewDidLoad() {
        super.viewDidLoad()
        coredata = CoredataManager.shared
        coredata?.save(movieTitle: "it", movieRating: 7.5)


    }
    
}


class CoredataManager{
    static let shared = CoredataManager()
    private init() {}
    
    
    func save(movieTitle : String , movieRating: Float) {
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let manageContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Movie", in: manageContext) else {fatalError("can not find the entity")}
        
        let movie = NSManagedObject(entity: entity, insertInto: manageContext)
        
        movie.setValue(movieTitle, forKey: "title")
        
        movie.setValue(movieRating, forKey: "rating")
        
        do {
            try manageContext.save()
            print("saved")
        }catch {
            print(error)
        }
    }
}
