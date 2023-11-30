//
//  ProfileScreenAPICalls.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import Foundation
import UIKit
import Alamofire

extension ProfileScreenController:ProfileScreenProtocol{
    func apiGetMeDetail(key:String){
        if let url = URL(string: APIConfigs.baseAuthURL + "me"){
                AF.request(url, method: .get, headers:
                            [
                                "x-access-token": key,
                            ])
                .responseData(completionHandler: { response in

                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                print("get detail success")
                                
                                
                                let decoder = JSONDecoder()
                                do{
             
                                    let receivedData = try decoder.decode(myDetailInfo.self, from: data)
                                    print(receivedData)

                                    self.profileScreen.labelName.text = "Name:   " + receivedData.name
                                    self.profileScreen.labelId.text = "Id:   " + receivedData._id
                                    self.profileScreen.labelEmail.text = "Email:   " + receivedData.email
                                    self.profileScreen.reloadInputViews()

                                }catch{
                                    print("JSON couldn't be decoded.")
                                }
//
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
