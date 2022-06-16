//
//  LeaguesVC.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import UIKit

class LeaguesVC: UIViewController {
  
    @IBOutlet weak var leaguesTV: UITableView!
    
    
    var leaguesViewModel:LeagueViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        leaguesTV.tableFooterView = UIView()
        leaguesViewModel.bindingResult = {
            self.leaguesTV.reloadData()
        }
        leaguesViewModel.getData()
    }
    
}

extension LeaguesVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leaguesViewModel.leagues?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LeaguesTVCell else {
            return UITableViewCell()
        }
        guard let leagues = leaguesViewModel.leagues else {return cell}
        
        cell.leagueImg.setImage(((leagues[indexPath.row].strLogo ?? leagues[indexPath.row].strBadge) ?? ""), "sports", true)
        cell.leagueNameLbl.text = leagues[indexPath.row].strLeague
        cell.tabAction = { [weak self] (cell) in
            
            if(self?.leaguesViewModel.leagues?[indexPath.row].strYoutube != ""){
                
                let youtube = "https://\(self?.leaguesViewModel.leagues?[indexPath.row].strYoutube ?? "https://m.youTube.com/")"
                let youTubeURL = URL(string: youtube)!
                
                     UIApplication.shared.open(youTubeURL)
               
            }else{
                 
                UIApplication.shared.open(URL(string:"https://m.youTube.com/")!)
            }
  
        }
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        guard let eventVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventVC") as? EventVC else {return}
        
        eventVC.eventViewModel = EventViewModel(idLeague: leaguesViewModel.leagues?[indexPath.row].idLeague ?? "", strLeague: leaguesViewModel.leagues?[indexPath.row].strLeague ?? "", league: (leaguesViewModel.leagues?[indexPath.row]) ?? Countries() )
        eventVC.modalPresentationStyle = .fullScreen
       self.present(eventVC, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.screenHeight / 8.5
    }
    
    
}
