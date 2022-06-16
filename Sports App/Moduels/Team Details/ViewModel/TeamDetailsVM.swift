//
//  TeamDetailsVM.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation


class TeamsDetailsViewModel {
    
    var details:Teams?{
        didSet{
            bindingresult()
        }
    }
    
    var bindingresult:(()->()) = {}
    
    init(details:Teams) {
        self.details = details
    }
    
    
}
