//
//  ProfileScreenController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import UIKit
import Alamofire

class ProfileScreenController: UIViewController {
    
    let profileScreen = ProfileScreen()
    
    var authToken = String()

    override func loadView() {
        view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        apiGetMeDetail(key:authToken)
    }

}
