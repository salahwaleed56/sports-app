//
//  EventVC.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import UIKit

class EventVC: UIViewController {

    @IBOutlet weak var upComingVew: UIView!
    
    @IBOutlet weak var noUpComingLbl: UILabel!
    
    @IBOutlet weak var noUpComingImg: UIImageView!
    
    @IBOutlet weak var upComingCV: UICollectionView!
    
    
    @IBOutlet weak var lastestResultCV: UICollectionView!
    
    
    @IBOutlet weak var teamsCV: UICollectionView!
    
 
    var eventViewModel:EventViewModel?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        eventViewModel?.bindingResultevents = { [weak self] in
            self?.upComingCV.reloadData()
            self?.lastestResultCV.reloadData()
            
        }
        eventViewModel?.bindingResultTeams = { [weak self] in
            self?.teamsCV.reloadData()
            
        }
        eventViewModel?.getData()
        eventViewModel?.getTeams()
    }
    
    @IBAction func goBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setFavouriteBtn(_ sender: UIButton) {
        eventViewModel?.addToCoreData()
        
    }
    
}

extension EventVC:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upComingCV{
            if eventViewModel?.upComming?.count == 0 {
                upComingCV.isHidden = true
                view.isHidden = false
                return 0
            }else{
                upComingCV.isHidden = false
                view.isHidden = true
            return eventViewModel?.upComming?.count ?? 0
            }
        }else if collectionView == lastestResultCV {
            return eventViewModel?.eventsResult?.count ?? 0
        }else{
            return eventViewModel?.teams?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upComingCV{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as? UPCommingCVCell else {return UICollectionViewCell()}
            cell.upCommingImg.setImage(eventViewModel?.upComming?[indexPath.row].strThumb ?? "f", "sports")
            
            cell.teamsEventLbl.text = "\(eventViewModel?.upComming?[indexPath.row].strHomeTeam ?? "") VS \(eventViewModel?.upComming?[indexPath.row].strAwayTeam ?? "")"
            cell.dateEventLbl.text = eventViewModel?.upComming?[indexPath.row].dateEvent
            cell.timeEventLbl.text = eventViewModel?.upComming?[indexPath.row].strTime
            return cell
        }else if collectionView == lastestResultCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? LastestResultCVCell else {return UICollectionViewCell()}
            cell.homeTeamLbl.text = eventViewModel?.eventsResult?[indexPath.row].strHomeTeam
            cell.awayTeamLbl.text = eventViewModel?.eventsResult?[indexPath.row].strAwayTeam
            cell.homeScoreLbl.text = eventViewModel?.eventsResult?[indexPath.row].intHomeScore
            cell.awayScoreLbl.text = eventViewModel?.eventsResult?[indexPath.row].intAwayScore
            cell.dateResLbl.text = eventViewModel?.eventsResult?[indexPath.row].dateEvent
            DispatchQueue.main.async {
                cell.lastestResImg.setImage(self.eventViewModel?.eventsResult?[indexPath.row].strThumb ?? self.eventViewModel?.eventsResult?[indexPath.row].strVenue ?? "ffd", "sports")
            }
       
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as? TeamsCVCell else {return UICollectionViewCell()}
            cell.teamsImg.setImage(eventViewModel?.teams?[indexPath.row].strTeamBadge ?? eventViewModel?.teams?[indexPath.row].strAlternate ?? "f", "sports" ,true)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == teamsCV {
            guard let teamDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeamDetailsVC") as? TeamDetailsVC else {return}
     
            teamDetails.teamDetailsViewModel = TeamsDetailsViewModel(details: (eventViewModel?.teams?[indexPath.row])!)
            teamDetails.modalPresentationStyle = .fullScreen
           self.present(teamDetails, animated: true, completion: nil)
         
    }
    
    
}
}
extension EventVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == upComingCV{
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }else if collectionView  == lastestResultCV {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right:0 )
        }else {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == upComingCV {
//        if UIDevice.current.userInterfaceIdiom == .pad{
//
//            return CGSize(width: Constants.screenWidth / 2 , height: Constants.screenHeight/3)
//
//        }else{
//            return CGSize(width: Constants.screenWidth * 0.9 , height: Constants.screenHeight / 3.4)
//            }
//        }else if collectionView == lastestResultCV {
//
//            if UIDevice.current.userInterfaceIdiom == .pad{
//
//                return CGSize(width: Constants.screenWidth   , height: Constants.screenHeight/3)
//
//            }else{
//                return CGSize(width: Constants.screenWidth   , height: Constants.screenHeight / 2.8)
//                }
//
//        }else{
//
//            if UIDevice.current.userInterfaceIdiom == .pad{
//
//                return CGSize(width: Constants.screenWidth / 2 , height: Constants.screenHeight/3)
//
//            }else{
//                return CGSize(width: Constants.screenWidth / 2.4 , height: Constants.screenHeight/3.4)
//                }
//
//        }
//
//}
 
}
