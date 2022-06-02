//
//  SignUpVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 13/05/22.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login_Tapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
