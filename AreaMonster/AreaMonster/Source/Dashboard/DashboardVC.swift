//
//  DashboardVC.swift
//  AreaMonster
//
//  Created by MAC on 02/08/2023.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContainer()
        
    }
    
    
    @IBAction func nextStepAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "changeIndex"), object: nil, userInfo: [ "index": sender.tag])
        
    }
    
    
    
    func loadContainer(){
        let VC = DashboardContainerVC.loadFromNib()
        addChild(VC)
        view.addSubview(VC.view)
        VC.view.frame = viewContainer.bounds
        VC.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        viewContainer.addSubview(VC.view)
    }

}
