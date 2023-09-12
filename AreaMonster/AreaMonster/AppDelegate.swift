//
//  AppDelegate.swift
//  AreaMonster
//
//  Created by MAC on 27/07/2023.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIFont.overrideInitialize()
        
        MOLHFont.shared.arabic = UIFont(name: "Chalkduster", size: 25)!
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
        
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        reset()
      
        IQKeyboardManager.shared.enable = true
        
        
          return true
      }
    
    func reset() {

        // StoryBoard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
//
        
        //Splash Screen
        let initialViewController = SplashScreenVC.loadFromNib()
          self.window?.rootViewController = initialViewController
          self.window?.makeKeyAndVisible()
        
    }

    
    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AreaMonster")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


}


// MARK: - Core Data stack
extension AppDelegate{
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
