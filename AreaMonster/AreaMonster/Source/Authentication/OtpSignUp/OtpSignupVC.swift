//
//  OtpSignupVC.swift
//  AreaMonster
//
//  Created by MAC on 02/08/2023.
//

import UIKit

class OtpSignupVC: UIViewController {

    @IBOutlet weak var otpTextField: AEOTPTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupOTPTextField()
    }

    
    @IBAction func validateActionVC(_ sender: UIButton) {
        let vc = HomeVC.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupOTPTextField() {
        otpTextField.otpDelegate = self
        otpTextField.otpFontSize = 16
        otpTextField.otpFilledBackgroundColor = .lightGray
        otpTextField.otpTextColor = .white
        otpTextField.otpFilledBorderWidth = 0
        otpTextField.configure()

      otpTextField.becomeFirstResponder()
    }
    



}


// MARK: - AEOTPTextField Delegate
//
extension OtpSignupVC: AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        
//      if staticCode == code {
//
//      }else{
//
//      }
     
    }
}
