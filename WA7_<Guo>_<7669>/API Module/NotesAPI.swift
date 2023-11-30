//
//  NotesAPI.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/30.
//

import Foundation
protocol ProfileScreenProtocol{
    func apiGetMeDetail(key:String)
}

protocol NotesScreenProtocol{
    func apiLogOut()
    func getAllNotes(key:String)
    func apiAddANewNotes(key:String,text:String)
    func apiDeleteNote(id:String,rowInt:Int,key:String)
}

protocol CoverScreenProtocol{
    func apiLogin(email:String,password:String)
}

protocol SignUpScreenProtocol{
    func createANewUser(registerInfo: RegisterInfo)
}
