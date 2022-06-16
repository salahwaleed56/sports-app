//
//  LastestResultCVCell.swift
//  Sports App
//
//  Created by salah waleed on 16/06/2022.
//

import UIKit

class LastestResultCVCell: UICollectionViewCell {
   
    
    @IBOutlet weak var lastestResImg: UIImageView!
    
    @IBOutlet weak var detailStack: UIStackView!
    
    @IBOutlet weak var homeTeamLbl: UILabel!
    
    @IBOutlet weak var homeScoreLbl: UILabel!
    
    @IBOutlet weak var awayScoreLbl: UILabel!
    
    @IBOutlet weak var awayTeamLbl: UILabel!
    
    @IBOutlet weak var dateResLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        setupui()
    }
    
    func setupui(){
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
    }
}
