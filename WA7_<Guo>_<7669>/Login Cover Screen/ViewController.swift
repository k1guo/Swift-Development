//
//  ViewController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let loginScreen = LoginScreen()
    
    let defaults = UserDefaults.standard
    
    var authToken = String()
    
    override func loadView() {
        view = loginScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginScreen.buttonSignup.addTarget(self, action: #selector(buttonSignup), for: .touchUpInside)
        loginScreen.buttonLogin.addTarget(self, action: #selector(buttonLogin), for: .touchUpInside)
    }
    
    
    @objc func buttonSignup(){
        let signUpScreen = SignUpController()
        self.navigationController?.pushViewController(signUpScreen, animated: true)
    }
    
    
    @objc func buttonLogin(){
        if let email = loginScreen.textFieldName.text,
           let password = loginScreen.textFieldPassword.text{
            if email.isEmpty{
                ValidationAlerts.showErrorAlert(self,"please enter your email")
            }else if(password.isEmpty){
                ValidationAlerts.showErrorAlert(self,"please enter your password")
            }else if(!ValidationAlerts.isValidEmail(email)){
                ValidationAlerts.showErrorAlert(self,"please enter valid email~~")
            }else{
                apiLogin(email:email,password:password)
            }
        }
    }
    
}
    
   



