//
//  ViewController.swift
//  Sports App
//
//  Created by salah waleed on 05/06/2022.
//

import UIKit

class SportsVc: UIViewController {

    //MARK:-properties
    
    var sportVewModel :SportViewModel?
    
    
    
    //MARK:- OutLet
    
    @IBOutlet weak var sportsCv: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   sportVewModel  = SportViewModel(sevices: BaseAPI())
        sportVewModel?.bindingResult = { [weak self] in
            DispatchQueue.main.async {
                self?.sportsCv.reloadData()
            }
         }
        sportVewModel?.getData()
    }


}

extension SportsVc:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        sportVewModel?.sports?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SportsCvCell else {return UICollectionViewCell()}
        guard let sports =  sportVewModel?.sports else {return
     cell}
        cell.sportsLbl.text = sports[indexPath.row].strSport
        cell.sportsImg.setImage(sports[indexPath.row].strSportThumb ?? "", "sports", false)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
         
        
        guard let leaguesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeaguesVC") as? LeaguesVC else {return}
        
        leaguesVC.leaguesViewModel = LeagueViewModel(sportName: sportVewModel?.sports?[indexPath.row].strSport)
//        self.present(sevc, animated: true, completion: nil)
        self.navigationController?.pushViewController(leaguesVC, animated: true)
}
}

extension SportsVc: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: sportsCv.frame.width / 2 , height: sportsCv.frame.height/3.1)
            
        }else{
            return CGSize(width: sportsCv.frame.width / 2.4 , height: sportsCv.frame.height/3.4)
            }
    }
    
}
