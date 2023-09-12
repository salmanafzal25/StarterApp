//
//  SplashScreenVC.swift
//  AreaMonster
//
//  Created by MAC on 01/08/2023.
//

import UIKit

class SplashScreenVC: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgLogoTitle: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        animate()
        goToLoginVC()
    }
    
    func animate(){
        
   //  clockContainerView.animateBounce(multiplier: 0.9, duration: 0.5)
        
        if MOLHLanguage.currentAppleLanguage() == "en"{
            imgLogo.transform =  CGAffineTransform(translationX: -(self.view.bounds.width * 0.7), y: 0.0)
            imgLogoTitle.transform =  CGAffineTransform(translationX: (self.view.bounds.width * 0.7), y: 0.0)
        }else{
            imgLogo.transform =  CGAffineTransform(translationX: (self.view.bounds.width * 0.7), y: 0.0)
            imgLogoTitle.transform =  CGAffineTransform(translationX: -(self.view.bounds.width * 0.7), y: 0.0)
          
        }
        
        UIView.animate(withDuration: 1.5, animations: {
           let zero = CGAffineTransform(translationX: 0.0, y: 0.0)
         //   self.btnSideMenu.transform = zero
            self.imgLogo.transform = zero
            self.imgLogoTitle.transform = zero
        })
        
    }

    
    
    private func goToLoginVC(){
   
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
//            let transition = CATransition()
//            transition.type = .fade
//            var window : UIWindow!
//            guard let temp : UIWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else {return}
//            window = temp
//
//            let initialViewController = LanguageSelectionVC.loadFromNib()
//
//              let navCon = UINavigationController()
//              navCon.viewControllers = [initialViewController]
//              navCon.navigationBar.isHidden = true
//              window.set(rootViewController: initialViewController, withTransition: transition)
//              window.makeKeyAndVisible()
            
            
            
//            let dashBoard = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let dashBoard = LanguageSelectionVC.loadFromNib()
           let nav = UINavigationController(rootViewController: dashBoard)
            nav.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = nav
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
            
            
            
        }
    }
    

}
