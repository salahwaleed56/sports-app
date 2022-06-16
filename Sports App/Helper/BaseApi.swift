//
//  BaseApi.swift
//  Sports App
//
//  Created by salah waleed on 15/06/2022.
//

import Foundation
import Alamofire

class BaseAPI {
    
    class func Get<T:Codable>(strURL:String,paramaters:[String:Any]?, headers:[String:String]?, completion: @escaping (_ status: Int,_ response: T?) -> Void){
        guard let handleUrl = (strURL).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let url = URL(string: handleUrl) else {return}
        var alamoHeaders : HTTPHeaders? = nil
        if headers != nil {
            alamoHeaders = HTTPHeaders(headers!)
        }
  
        AF.request(url, method: .get, parameters: paramaters, encoding: URLEncoding.default, headers: alamoHeaders).responseJSON { (response) in
            switch response.result{
            
            case .success(_):
                guard let data = response.data else {return}
                do {
                    let results = try JSONDecoder().decode(T.self, from: data)
                    completion(1,results)
                }
                catch{
                    print(error.localizedDescription)
                    completion(0,nil)
                }
                
            case .failure(_):
                print(response.error?.localizedDescription ?? "")
                completion(0,nil)
            }
        }
    }
}
