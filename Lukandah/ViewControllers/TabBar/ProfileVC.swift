//
//  ProfileVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 14/05/22.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var profileTable: UITableView!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var appId: UILabel!
    @IBOutlet weak var proImageView: UIView!
    @IBOutlet weak var bookingCount: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let profileOptionArray = ["Manage your account","Rewards & Wallet","Gift cards","Contact us","Settings","Sign out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellLoad()
        profileTable.dataSource = self
        profileTable.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

   
    func cellLoad(){
        profileTable.register(UINib.init(nibName: "ProfileTableCell", bundle: nil), forCellReuseIdentifier: "ProfileTableCell")
    }
    @IBAction func onNotificationTap(_ sender: Any) {
    }
    @IBAction func onPencilTap(_ sender: Any) {
        let vc = storyBoards.Bottombar.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onNextTap(_ sender: Any) {
    }
    
    @IBAction func onSideMenuTap(_ sender: Any) {
    }
    
}

extension ProfileVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileOptionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTable.dequeueReusableCell(withIdentifier: "ProfileTableCell") as! ProfileTableCell
        cell.titleLbl.text = profileOptionArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
}
