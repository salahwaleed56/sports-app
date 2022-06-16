//
//  FavLegueVc.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import UIKit

class FavLegueVc: UIViewController {

    var favLeagueViewModel:FavouriteLeagueViewModel?
    @IBOutlet weak var favTv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fsafsasvafsfvssvf")
        favLeagueViewModel = FavouriteLeagueViewModel()
        favLeagueViewModel?.getcoredata()
        favLeagueViewModel?.bindingResult = {
            self.favTv.reloadData()
        }
        
    }
    
 

}


extension FavLegueVc:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FavLeagueCell else {return UITableViewCell()}
        cell.leagueImg.setImage(favLeagueViewModel?.leagdetail?[indexPath.row].strLogo ?? "", "sports", true)
        cell.leagueNameLbl.text = favLeagueViewModel?.leagdetail?[indexPath.row].strLeague ?? ""
        cell.tabAction =
            { [weak self] (cell) in
                
                if(self?.favLeagueViewModel?.leagdetail?[indexPath.row].strYoutube != ""){
                    
                    let youtube = "https://\(self?.favLeagueViewModel?.leagdetail?[indexPath.row].strYoutube ?? "https://m.youTube.com/")"
                    let youTubeURL = URL(string: youtube)!
                    
                         UIApplication.shared.open(youTubeURL)
                   
                }else{
                     
                    UIApplication.shared.open(URL(string:"https://m.youTube.com/")!)
                }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favLeagueViewModel?.leagdetail?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let eventVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventVC") as? EventVC else {return}

        eventVc.eventViewModel = EventViewModel(idLeague: favLeagueViewModel?.leagdetail?[indexPath.row].idLeague ?? "", strLeague: favLeagueViewModel?.leagdetail?[indexPath.row].strLeague ?? "", league: (favLeagueViewModel?.leagdetail?[indexPath.row]) ?? Countries() )
        eventVc.modalPresentationStyle = .fullScreen
       self.present(eventVc, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.screenHeight / 8.5
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            CoreDataManager.shared.delete(id: (favLeagueViewModel?.leagdetail?[indexPath.row].idLeague) ?? "")
            favLeagueViewModel?.leagdetail?.remove(at: indexPath.row)
            // Then, delete the row from the table itself
      
            tableView.reloadData()
           
        }
    }
    
}
