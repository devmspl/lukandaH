//
//  LikeVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 14/05/22.
//

import UIKit

class LikeVC: UIViewController {

    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var searchTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.dataSource = self
        searchTable.delegate = self
        cellLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func cellLoad(){
        searchTable.register(UINib.init(nibName: "HotellistViewCell", bundle: nil), forCellReuseIdentifier: "HotellistViewCell")
    }
   
    @IBAction func onNotificationTap(_ sender: Any) {
        
    }
    
    @IBAction func onSideMenuTap(_ sender: Any) {
        
    }
    
    @IBAction func onNetworkTap(_ sender: Any) {
        guard let vc = storyBoards.BottomSheetViews.instantiateViewController(withIdentifier: "FilterSheetVC") as? FilterSheetVC else {return}
        self.present(vc, animated: true)
    }
    
    @IBAction func onFilerTap(_ sender: Any) {
        guard let vc = storyBoards.BottomSheetViews.instantiateViewController(withIdentifier: "SortByVC") as? SortByVC else {return}
        self.present(vc, animated: true)
    }
    
    @IBAction func onMapTap(_ sender: Any) {
    }
}


extension LikeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "HotellistViewCell", for: indexPath) as! HotellistViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyBoards.Bottombar.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
