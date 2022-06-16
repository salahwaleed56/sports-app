//
//  SportsCvCell.swift
//  Sports App
//
//  Created by salah waleed on 12/06/2022.
//

import UIKit

class SportsCvCell: UICollectionViewCell {
    
    //MARK:-Outlet
    
    @IBOutlet weak var sportsImg: UIImageView!
    
    @IBOutlet weak var sportsView: UIView!
    
    @IBOutlet weak var sportsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUi()
    }
    func setupUi(){
   
        if UIDevice.current.userInterfaceIdiom == .phone{
        sportsView.layer.cornerRadius = 15
            contentView.layer.cornerRadius = 10
        }else{
            sportsView.layer.cornerRadius = 15
        }
        sportsView.layer.masksToBounds = true
    }
}
