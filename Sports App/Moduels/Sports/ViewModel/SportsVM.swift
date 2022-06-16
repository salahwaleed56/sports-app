//
//  SportsVM.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation


class SportViewModel {
    
    var sports:[Sport]?{
        didSet{
            bindingResult()
        }
    }
    
    
    var bindingResult : (()->()) = {}
    init(sevices:BaseAPI) {
        
    }
    
    func getData(){
        DispatchQueue.global().async {
            
        
       let url = Constants.getSports_URL()
     
        BaseAPI.Get(strURL: url, paramaters: nil, headers: nil) { [weak self] (status, response:AllSports?) in
            if status != 1 {
                print("erorr")
            }else{
                guard let result = response else {return}
                self?.sports = result.sports
                 
                    
                }
            }
        
    }
    }
    }

