//
//  keyInfo.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import Foundation
struct keyInfo: Codable{
    var auth:Bool
    var token:String

    
    init(auth: Bool, token:String) {
        self.auth=auth
        self.token=token
    }
}



