//
//  DashboardContainerVC.swift
//  AreaMonster
//
//  Created by MAC on 03/08/2023.
//

import UIKit
var currentVCIndex = 0

class DashboardContainerVC: UIPageViewController {

        
        lazy var viewControllersList:[UIViewController] = {
            let vc1 = Step1CatSelectionVC()
            let vc2 = Step2ItemDetailVC()
            let vc3 = Step3DeliveryDetailVC()
            let vc4 = Step4ConfirmationVC()
            return [vc1, vc2, vc3, vc4]
        }()
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

        override func viewDidLoad() {
            super.viewDidLoad()
            
        
            
            
            currentVCIndex = 0
            slideVCInRightDirection(index: 0)
            
            //== change VC Index Listner
            NotificationCenter.default.addObserver(self, selector: #selector(changeIndex(notification:)), name: NSNotification.Name(rawValue: "changeIndex"), object: nil)
            
        }
        
        
        @objc func changeIndex(notification : NSNotification) {
            
            let direction = notification.userInfo!["index"]! as! Int
            
            if direction == currentVCIndex {return}

            if direction > currentVCIndex {
                self.slideVCInRightDirection(index: direction)
            }else{
                self.slideVCInLeftDirection(index: direction)
            }
            currentVCIndex = direction
        }
       
        //navigate to a specific index
        func slideVCInRightDirection(index: Int){
            self.setViewControllers([viewControllersList[index]], direction: .forward, animated: true, completion: nil)
        }
        
        func slideVCInLeftDirection(index: Int){
            self.setViewControllers([viewControllersList[index]], direction: .reverse, animated: true, completion: nil)
        }

        //count of vc
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return viewControllersList.count
        }
        
    }



