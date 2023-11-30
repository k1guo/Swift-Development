//
//  File.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import Foundation

struct noteInfo: Codable{
    let _id:String
    let userId:String
    let text:String
    var __v:Int
    
    init(_id:String, userId:String, text:String, __v:Int) {
        self._id = _id
        self.userId = userId
        self.text = text
        self.__v = __v
    }
}

struct notes: Codable{
    let notes: [noteInfo]
}
