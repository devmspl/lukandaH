//
//  HomeVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 13/05/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topView.roundCorners([.bottomLeft,.bottomRight], radius: 25)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource , UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyBoards.Bottombar.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        return cell
    }
    
    
}




class TableCell : UITableViewCell{
    
}

class CollectionCell : UICollectionViewCell{
    
}
