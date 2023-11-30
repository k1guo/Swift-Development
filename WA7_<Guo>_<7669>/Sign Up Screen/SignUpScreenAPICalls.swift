//
//  SignUpScreenAPICalls.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import Foundation
import UIKit
import Alamofire

extension SignUpController:SignUpScreenProtocol{
    
    func createANewUser(registerInfo: RegisterInfo){
        if let url = URL(string: APIConfigs.baseAuthURL + "register"){
                AF.request(url, method: .post, parameters:
                            [
                                "name": registerInfo.name,
                                "email": registerInfo.email,
                                "password": registerInfo.password
                            ])
                .responseData(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...

                                    let decoder = JSONDecoder()
                                    do{
                                        print(decoder)
                                        let receivedData = try decoder.decode(keyInfo.self, from: data)
                                        print(receivedData)
                                        
                                        let valueToBeSaved = receivedData.token
                                        let defaults = UserDefaults.standard
                                        let apiKeySaved = defaults.object(forKey: "apiKey") as! String?
                                                
                                        if let apiKey = apiKeySaved{
                                            print("The Saved API Key: \(apiKey)")
                                        }else{
                                            print("No API Key saved at the moment!")
                                        }
                                        defaults.set(valueToBeSaved, forKey: "apiKey")

                                    }catch{
                                        print("JSON couldn't be decoded.")
                                    }
                                    print(data)
                                    let Alert = UIAlertController(title: "Create Success!", message: "Your account created!", preferredStyle: .alert)

                                    let okAction = UIAlertAction(title:  "Ok", style: .cancel) { [self] (action) in
                                        self.navigationController?.pushViewController(notesScreen, animated: true)
                                    }
                                    Alert.addAction(okAction)
                                    self.present( Alert, animated: true)
                                
                                    break
                        
                                case 400...499:
                                    print(data)
                                    break
                                case 500...599:
                                    print(data)
                                ValidationAlerts.showErrorAlert(self, "account already exist!")
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
