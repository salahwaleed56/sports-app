//
//  LeaguesTVCell.swift
//  Sports App
//
//  Created by salah waleed on 15/06/2022.
//

import UIKit

class LeaguesTVCell: UITableViewCell {

    
    var tabAction : ((UITableViewCell)->())?
    
    //MARK:-OUTLET
    
    @IBOutlet weak var backVewCell: UIView!
    
    @IBOutlet weak var leagueImg: UIImageView!
    
    @IBOutlet weak var leagueNameLbl: UILabel!
    
    @IBOutlet weak var youtubeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    func setupUI()  {
     
        backVewCell.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openYoutubeBtn(_ sender: UIButton) {
        tabAction?(self)
    }
}
