//
//  AddANoteAPICalls.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/30.
//

import Foundation


import Foundation
import Alamofire
import UIKit

extension AddNoteViewController{
    func addANewNote(key:String,text:String){
        if let url = URL(string: APIConfigs.baseNoteURL + "post"){
            AF.request(url, method: .post,parameters: [
                "text": text
            ], headers:["x-access-token":key])
                        .responseData(completionHandler: { response in
       
                            let status = response.response?.statusCode
//                            print(status,"status")
                            switch response.result{
                            case .success(let data):
                                if let uwStatusCode = status{
                                    switch uwStatusCode{
                                        case 200...299:
                                        
                                        self.notificationCenter.post(
                                            name: .addedANewNote,
                                            object: nil)
                                        self.navigationController?.popViewController(animated: true)
                                            break
                                
                                        case 400...499:
                                            print(data)
                                            break
                                
                                        default:
                                            print(data)
                                            break
                                    }
                                }
                                break
                                
                            case .failure(let error):
                                //MARK: there was a network error...
                                print(error)
                                break
                            }
                        })
                    }
            }
}
