//
//  HomeVC.swift
//  AreaMonster
//
//  Created by MAC on 04/08/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    

var selectedServiceIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }

    
    func uiSetup(){
        servicesCollectionView.layer.cornerRadius =  20
        servicesCollectionView.clipsToBounds = true
        servicesCollectionView.layer.maskedCorners = [.layerMinXMinYCorner]

        servicesCollectionView.register(ServicesMainCell.nib, forCellWithReuseIdentifier: ServicesMainCell.identifier)
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        
    }
    
    
}







extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesMainCell.identifier, for: indexPath) as! ServicesMainCell
//        cell.containerView.isRouned = true // .dropShadow()
        
//        if selectedServiceIndex == indexPath.item{
//            cell.containerView.dropShadow()
//        }else{
//            cell.containerView.layer.shadowOpacity = 0
//        }
       
        return cell
    }
    
    
 
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let height = (collectionView.frame.size.width / 3) - 10

            return CGSize(width: height, height: height)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedServiceIndex = indexPath.item

        collectionView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            collectionView.isUserInteractionEnabled = true
            let vc = DashboardVC.loadFromNib()
            self.navigationController?.pushViewController(vc, animated: true)
        }
  

    }
    

}


