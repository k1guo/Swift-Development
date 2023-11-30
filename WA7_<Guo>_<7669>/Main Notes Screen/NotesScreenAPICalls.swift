//
//  NotesScreenAPICalls.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import Foundation
import UIKit
import Alamofire

extension NotesScreenController:NotesScreenProtocol{
    
    func apiLogOut(){
        if let url = URL(string: APIConfigs.baseAuthURL + "logout"){
                AF.request(url, method: .get)
                .responseData(completionHandler: { response in

                    let status = response.response?.statusCode

                    switch response.result{
                    case .success(let data):

                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                
                                    print("log out success")
                                
                                    self.loginScreen.defaults.removeObject(forKey: "apiKey")
                                    self.navigationController?.popToRootViewController(animated: true)
                                
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
                        print(error)
                        break
                    }
                })
            }
    }
    
    
    
    func getAllNotes(key:String){
        print(key,"the string key")
        if let url = URL(string: APIConfigs.baseNoteURL + "getall"){
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

                                    print(data)
                                    print("success")
                                    self.allNotes.removeAll()
                                    let decoder = JSONDecoder()
                                    do{
                                        let receivedData =
                                            try decoder
                                            .decode(notes.self, from: data)
                                        
                                        for item in receivedData.notes{
                                            self.allNotes.append(item)
                                        }
            
                                        self.notesScreen.tableViewNotes.reloadData()
                                    }catch{
                                        print("JSON couldn't be decoded.")
                                    }

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
   
                        print(error)
                        break
                    }
                })
            }
    }
    
    
    
    func apiAddANewNotes(key:String,text:String){
        if let url = URL(string: APIConfigs.baseNoteURL + "post"){
            AF.request(url, method: .post,parameters: [
                "text": text
            ], headers:["x-access-token":key])
                        .responseData(completionHandler: { response in
       
                            let status = response.response?.statusCode

                            switch response.result{
                            case .success(let data):
                                if let uwStatusCode = status{
                                    switch uwStatusCode{
                                        case 200...299:
                                        print("success add a new one")

                                        let decoder = JSONDecoder()
                                        do{
                                            let receivedData =
                                                try decoder
                                                .decode(addANewNoteInfo.self, from: data)
                                                print(receivedData,"received")
                                            
                                            let newNotes = noteInfo( _id:receivedData.note._id,userId: receivedData.note.userId,text: receivedData.note.text,__v: receivedData.note.__v)
                                   
                                            self.allNotes.append(newNotes)
                                            self.notesScreen.tableViewNotes.reloadData()
                                        }catch{
                                            print("JSON couldn't be decoded.")
                                        }
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
    
    
    
    func apiDeleteNote(id:String,rowInt:Int,key:String){
        if let url = URL(string: APIConfigs.baseNoteURL+"delete"){
                            AF.request(url, method:.post,
                                       parameters: ["id":id],
                                       headers: ["x-access-token":key])
                            .responseString(completionHandler: { response in
        
                                let status = response.response?.statusCode
//                                print(status,"status")
                                switch response.result{
                                case .success(let data):
                                    if let uwStatusCode = status{
                                        switch uwStatusCode{
                                        case 200...299:
                                            self.allNotes.remove(at: rowInt)
                                            self.notesScreen.tableViewNotes.reloadData()
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
                                    print(error)
                                    break
                                }
                            })
                        }
    }
    
}
