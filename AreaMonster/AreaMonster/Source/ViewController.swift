//
//  ViewController.swift
//  AreaMonster
//
//  Created by MAC on 27/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var txtLanguage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Identidier MOLH:",MOLHLanguage.currentAppleLanguage())
        
        lblLanguage.text = "hello.key".localizedString
        lblLanguage.updateFont()
        
        
    }
    
    

    @IBAction func btnChangeLanguage(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset(transition: .transitionCrossDissolve, duration: 0.25)
    }
    
    
    
}

