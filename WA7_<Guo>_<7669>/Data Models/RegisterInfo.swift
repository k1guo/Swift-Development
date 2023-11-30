//
//  RegisterInfo.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import Foundation

struct RegisterInfo{
    var name:String
    var email:String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

struct myDetailInfo:Codable{
    var _id:String
    var name:String
    var email:String
    var __v:Int
}
