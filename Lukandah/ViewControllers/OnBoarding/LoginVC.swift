//
//  LoginVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 13/05/22.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
       
    @IBAction func creatAccount_tapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func continue_tapped(_ sender: Any) {
        let vc = storyBoards.Bottombar.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotPass_tapped(_ sender: Any) {
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "ForgotPassVC") as! ForgotPassVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
