//
//  FavLeagueCell.swift
//  Sports App
//
//  Created by salah waleed on 16/06/2022.
//

import UIKit

class FavLeagueCell: UITableViewCell {

    var tabAction : ((UITableViewCell)->())?
    @IBOutlet weak var backVew: UIView!
    
    @IBOutlet weak var leagueImg: UIImageView!
    
    @IBOutlet weak var leagueNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    func setupUI()  {
     
        backVew.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func goYoutubeImg(_ sender: UIButton) {
        tabAction?(self)
    }
}
