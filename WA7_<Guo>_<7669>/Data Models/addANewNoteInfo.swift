//
//  addANewNoteInfo.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import Foundation

struct Info: Codable{
    
    let userId:String
    let text:String
    let _id:String
    var __v:Int
    
    init(userId:String, text:String,_id:String, __v:Int) {
        self.userId = userId
        self.text = text
        self._id = _id
        self.__v = __v
    }
}

struct addANewNoteInfo: Codable{
    let posted: Bool
    let note: Info
}
