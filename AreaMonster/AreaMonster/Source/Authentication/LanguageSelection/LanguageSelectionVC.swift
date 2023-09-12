//
//  LanguageSelectionVC.swift
//  AreaMonster
//
//  Created by MAC on 27/07/2023.
//

import UIKit

class LanguageSelectionVC: UIViewController {

    @IBOutlet weak var lblLanguage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Identidier MOLH:",MOLHLanguage.currentAppleLanguage())
        
        lblLanguage.text = "hello.key".localizedString
        lblLanguage.updateFont()

    }
    
    @IBAction func btnChangeLanguage(_ sender: Any) {
//        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
//        MOLH.reset(transition: .transitionCrossDissolve, duration: 0.25)
        
        let vc = OtpSignupVC.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: true)
       
       // self.present(vc, animated: true)
        
        
        
    }

}
