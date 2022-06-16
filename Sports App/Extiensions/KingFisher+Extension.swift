//
//  KingFisher+Extension.swift
//  Sports App
//
//  Created by salah waleed on 15/06/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ strUrl:String,_ imageName:String,_ rounded:Bool = true){
        
        guard let imageUrl  =  URL(string: strUrl) else {
            return
        }
        if rounded {
            let processor = ResizingImageProcessor(referenceSize: self.frame.size) |> RoundCornerImageProcessor(cornerRadius: self.frame.size.width / 2)
            
            self.kf.setImage(with: imageUrl, placeholder: UIImage(named: imageName),options: [.processor(processor)])
        }else{
            self.kf.setImage(with: imageUrl, placeholder: UIImage(named: imageName))
        }
    }
}
