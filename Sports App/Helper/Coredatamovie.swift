//
//  Coredatamovie.swift
//  TableWithCoredata
//
//  Created by salah waleed on 31/05/2022.
//

import Foundation
import CoreData
import UIKit
class CoreDataManager {
    static let shared = CoreDataManager()
    private init(){
        viewContext = appDelegate.persistentContainer.viewContext
    }
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext?
    
    var currentUser: NSManagedObject?
    let userEntityName = "LeagueFav"
    
    
    enum mykeys:String,CodingKey {
        case id = "id"
        case rank = "rank"
        case image = "image"
        case name = "name"
        case strYoutube = "strYoutube"
      
    }
    
    func add(league:Countries){
        
        guard let viewContext = viewContext else {return}
        
        
        
        guard let entity = NSEntityDescription.entity(forEntityName: userEntityName,
                                                      in: viewContext) else { return }
     
        
            let leg = NSManagedObject(entity: entity,
                                      insertInto: viewContext)
        leg.setValue(league.idLeague, forKey: mykeys.id.rawValue)
        leg.setValue(league.strLogo, forKey: mykeys.image.rawValue)
        leg.setValue(league.strLeague, forKey: mykeys.name.rawValue)
        leg.setValue(league.strYoutube, forKey: mykeys.strYoutube.rawValue)
 
 
          
        
        appDelegate.saveContext()
 print("saved")
    }
    
    
    func get()->[Countries] {
        var arr = [Countries]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: userEntityName)
        
        //        let myPredicate = NSPredicate(format: "name == %@", "Nouran 3")
        //        fetchRequest.predicate = myPredicate
//        var mm = NSPredicate(nil)
        //        var id = 1
        //        let myPredicate = NSPredicate(format: "id == %@", "\(id)")
        ////        let myPredicate = NSPredicate(format: "id == %@", "1")
        //        fetchRequest.predicate = myPredicate
        
        do {
            let leagues = try viewContext!.fetch(fetchRequest)
//            print("Count: \(movieFromCoreData.count )")
            print(fetchRequest)
            
            for leg in  leagues {
 
                let myobj2 =  Countries(idLeague: leg.value(forKey: mykeys.id.rawValue) as? String ?? "", strLeague: leg.value(forKey: mykeys.name.rawValue) as? String ?? "",  strYoutube: leg.value(forKey: mykeys.strYoutube.rawValue) as? String ?? "", strLogo: leg.value(forKey: mykeys.image.rawValue) as? String ?? "")
                
    arr.append(myobj2)
                 print("data come successfuly")
            }
//            print(arr.count)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return arr
    }
    
    func delete(id:String){
        guard let viewContext = viewContext else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: userEntityName)
        fetchRequest.returnsObjectsAsFaults = false
                let myPredicate = NSPredicate(format: "id == %@", "\(id)")
        ////        let myPredicate = NSPredicate(format: "id == %@", "1")
            fetchRequest.predicate = myPredicate
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    viewContext.delete(managedObjectData)
                }
//                print(results)
//                print("\(results.count)deltetd")
                appDelegate.saveContext()
                print("deleted!!!!!!!!!!!!!!")
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
}

