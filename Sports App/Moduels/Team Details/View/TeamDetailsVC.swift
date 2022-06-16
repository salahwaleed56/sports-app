//
//  TeamDetailsVC.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import UIKit

class TeamDetailsVC: UIViewController {

    var teamDetailsViewModel:TeamsDetailsViewModel?
    
    //MARK:-Outlet
    @IBOutlet weak var staduimImg: UIImageView!
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamNameLbl: UILabel!
    
    
    @IBOutlet weak var sinceLbl: UILabel!
    @IBOutlet weak var teamCountryLbl: UILabel!
    
    @IBOutlet weak var teamStadiuim: UILabel!
    
 
    
    @IBOutlet weak var staduimCapecity: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamDetailsViewModel?.details?.strTeam ?? "")
        teamDetailsViewModel?.bindingresult = {
             
        }
        setupUI()
    }
    
    func setupUI(){
    
        staduimImg.setImage(teamDetailsViewModel?.details?.strStadiumThumb ?? "f", "sports")
   
        teamImage.setImage(teamDetailsViewModel?.details?.strTeamBadge ?? "f", "sports", true)
        teamNameLbl.text = teamDetailsViewModel?.details?.strTeam ?? ""
        sinceLbl.text = teamDetailsViewModel?.details?.intFormedYear ?? ""
        teamCountryLbl.text = teamDetailsViewModel?.details?.strCountry ?? ""
        teamStadiuim.text = teamDetailsViewModel?.details?.strStadium ?? ""
        staduimCapecity.text = teamDetailsViewModel?.details?.intStadiumCapacity ?? ""
        
    }
 
    @IBAction func goBackbTn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goWebsite(_ sender: UIButton) {
        
        if(teamDetailsViewModel?.details?.strWebsite != ""){
            
            let website = "https://\(teamDetailsViewModel?.details?.strWebsite ?? "https://m.google.com/")"
            let websiteURL = URL(string: website)!
            
                 UIApplication.shared.open(websiteURL)
           
        }else{
             
            UIApplication.shared.open(URL(string:"https://m.google.com/")!)
        }
        
        
    }



    @IBAction func goFacebook(_ sender: UIButton) {
        if(teamDetailsViewModel?.details?.strFacebook != ""){
            
            let website = "https://\(teamDetailsViewModel?.details?.strFacebook ?? "https://m.facebook.com/")"
            let websiteURL = URL(string: website)!
            
                 UIApplication.shared.open(websiteURL)
           
        }else{
             
            UIApplication.shared.open(URL(string:"https://m.facebook.com/")!)
        }
    }
    
    @IBAction func goTwitter(_ sender: UIButton) {
        if(teamDetailsViewModel?.details?.strTwitter != ""){
            
            let website = "https://\(teamDetailsViewModel?.details?.strTwitter ?? "https://m.twitter.com/")"
            let websiteURL = URL(string: website)!
            
                 UIApplication.shared.open(websiteURL)
           
        }else{
             
            UIApplication.shared.open(URL(string:"https://m.twitter.com/")!)
        }
    }
    
    @IBAction func goYoutube(_ sender: UIButton) {
        if(teamDetailsViewModel?.details?.strYoutube != ""){
            
            let website = "https://\(teamDetailsViewModel?.details?.strYoutube ?? "https://m.Youtube.com/")"
            let websiteURL = URL(string: website)!
            
                 UIApplication.shared.open(websiteURL)
           
        }else{
             
            UIApplication.shared.open(URL(string:"https://m.Youtube.com/")!)
        }
    }
    



}
