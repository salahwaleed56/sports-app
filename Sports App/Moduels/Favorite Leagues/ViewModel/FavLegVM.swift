//
//  FavLegVM.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation

class FavouriteLeagueViewModel {
    var leagdetail:[Countries]?{
        didSet{
            bindingResult()
        }
    }
    var bindingResult: (()->()) = {}
    func getcoredata(){
     leagdetail =  CoreDataManager.shared.get()
        print("coredata")
    }
    
}
