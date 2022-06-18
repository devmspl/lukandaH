//
//  HomeVC.swift
//  Lukandah
//
//  Created by MacBook M1 on 13/05/22.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchCollectionView: UICollectionView!
        
    var hotelData = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gethotel()
        self.topView.layer.cornerRadius = 25
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner ]
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource , UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        cell.Hotelname.text = hotelData[indexPath.row]["name"] as! String
        cell.Charges.text = "\(hotelData[indexPath.row]["price"] as! Int)"
        cell.Reviews.text = hotelData[indexPath.row]["description"] as! String
        cell.Location.text = hotelData[indexPath.row]["discount"] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyBoards.Bottombar.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
        vc.hotelId = hotelData[indexPath.row]["id"] as! String
        self.navigationController?.pushViewController(vc, animated: true)
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.HotelCollectionname.text = hotelData[indexPath.row]["name"] as! String
        cell.Hotelcollectiondescription.text = hotelData[indexPath.row]["description"] as! String
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hc = storyboard?.instantiateViewController(withIdentifier: "HotelDetailsVC") as! HotelDetailsVC
        hc.hotelId = hotelData[indexPath.row]["id"] as! String
        self.navigationController?.pushViewController(hc, animated: true)
    }
    
}




class TableCell : UITableViewCell{
    @IBOutlet weak var Hotelimage: UIImageView!
    @IBOutlet weak var Hotelname: UILabel!
    @IBOutlet weak var Reviews: UILabel!
    @IBOutlet weak var Ratingimage: UIImageView!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Charges: UILabel!
    
}

class CollectionCell : UICollectionViewCell{
    @IBOutlet weak var Hotelcollectionimages: UIImageView!
    @IBOutlet weak var HotelCollectionname: UILabel!
    @IBOutlet weak var Hotelcollectiondescription: UILabel!
    
}

extension HomeVC{
    func gethotel(){
        AF.request(Api.Gethotel,method: .get).responseJSON{
            response in
            switch(response.result){
            case .success(let json):do{
                let status = response.response?.statusCode
                let respond = json as! NSDictionary
                print(respond)
                if status == 200{
                    self.hotelData = respond.object(forKey: "data") as! [AnyObject]
                    self.tblView.reloadData()
                    self.searchCollectionView.reloadData()
                }else{
                    print("error")
                }
            }
            case .failure(let error):do{
                print(error)
            }
            }
        }
    }
}
