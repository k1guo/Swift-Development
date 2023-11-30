//
//  APICalls.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import Foundation
import UIKit
import Alamofire


extension ViewController:CoverScreenProtocol{
    
    func apiLogin(email: String, password: String) {
        if let url = URL(string: APIConfigs.baseAuthURL + "login"){
                AF.request(url, method: .post, parameters:
                            [
                                "email": email,
                                "password": password
                            ])
                .responseData(completionHandler: { response in

                    let status = response.response?.statusCode
                    switch response.result{
                    case .success(let data):
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                    let decoder = JSONDecoder()
                                    do{
                                        let receivedData = try decoder.decode(keyInfo.self, from: data)
                                        let valueToBeSaved = receivedData.token
                                        self.defaults.set(valueToBeSaved, forKey: "apiKey")
                                        
                                        let mainScreen = NotesScreenController()
                                        mainScreen.authToken = receivedData.token
                                        self.navigationController?.pushViewController(mainScreen, animated: true)

                                    }catch{
                                            print("JSON couldn't be decoded.")
                                    }
                                    
                                    break
                        
                                case 401:
                                    print(data)
                                ValidationAlerts.showErrorAlert(self,"Wrong Password !" )
                                
                                    break
                                
                                case 404:
                                    print(data)
                                ValidationAlerts.showErrorAlert(self,"No user found" )
           
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
