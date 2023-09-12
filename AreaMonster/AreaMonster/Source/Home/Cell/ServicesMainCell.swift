//
//  ServicesMainCell.swift
//  AreaMonster
//
//  Created by MAC on 04/08/2023.
//

import UIKit

class ServicesMainCell: UICollectionViewCell {

    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageService: UIImageView!
    @IBOutlet weak var lblService: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override var isSelected: Bool {
           didSet {
               
               if self.isSelected{
                   self.containerView.dropShadow()
               }else{
                   self.containerView.layer.shadowOpacity = 0
               }
               
               UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                   self.layer.zPosition = self.isSelected ? 1 : -1
                   self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.2, y: 1.2) : CGAffineTransform.identity
               }, completion: nil)
           }
       }

}
