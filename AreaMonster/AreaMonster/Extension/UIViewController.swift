//
//  UIViewController.swift
//  talkMD-International-Provider
//
//  Created by Ahtazaz on 10/15/20.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit
extension UIViewController {

    func addChildController(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func removeChildController() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    
    
    //To Load Nib View Controllers
    static func loadFromNib() -> Self {
            func instantiateFromNib<T: UIViewController>() -> T {
                return T.init(nibName: String(describing: T.self), bundle: nil)
            }

            return instantiateFromNib()
        }
    
}



//extension UIView {
//    class func fromNib<T: UIView>() -> T {
//        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
//    }
//}

extension UIView {

    public class func fromNib() -> Self {
        return fromNib(nibName: nil)
    }

    public class func fromNib(nibName: String?) -> Self {
        func fromNibHelper<T>(nibName: String?) -> T where T : UIView {
            let bundle = Bundle(for: T.self)
            let name = nibName ?? String(describing: T.self)
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        return fromNibHelper(nibName: nibName)
    }
}



extension UIViewController {
    func topMostViewController() -> UIViewController {

        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }

        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }

        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
    }

        return self
    }
}
