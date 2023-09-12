//
//  UISearchbar.swift
//  TalkLive
//
//  Created by Ahtazaz on 01/09/2021.
//

import UIKit

extension UISearchBar {
    
    func setupAsCustomTextField(placeholderText: String) {
        self.backgroundImage = UIImage()
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.placeholder = placeholderText
            textField.font = UIFont(name: "Roboto-Regular", size: 14)
            textField.rightView = nil
            textField.leftView = UIImageView(image: UIImage(named: "search.orange.icon"))
            textField.clearButtonMode = .whileEditing
            textField.rightViewMode = .unlessEditing
            textField.backgroundColor = .white//.white
            textField.layer.cornerRadius = 8
            textField.layer.borderColor = UIColor.green.cgColor
            textField.layer.borderWidth = 1
        }
    }

}
