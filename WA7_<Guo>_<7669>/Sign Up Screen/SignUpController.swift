//
//  SignUpController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import UIKit
import Alamofire


class SignUpController: UIViewController {
    
    let signUpScreen = SignUpScreen()
    
    let notesScreen = NotesScreenController()
    
    override func loadView() {
        view = signUpScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpScreen.buttonSignUp.addTarget(self, action: #selector(buttonSignUpTaped), for: .touchUpInside)
    }
    
    @objc func buttonSignUpTaped(){
        if let name = signUpScreen.textFieldName.text,
           let email = signUpScreen.textFieldEmail.text,
           let password = signUpScreen.textFieldPassword.text{
            if(name.isEmpty){
                ValidationAlerts.showErrorAlert(self,"please neter your name")
            }else if(email.isEmpty){
                ValidationAlerts.showErrorAlert(self,"please neter your email")
            }else if(password.isEmpty){
                ValidationAlerts.showErrorAlert(self,"please neter your password")
            }else if(!ValidationAlerts.isValidEmail(email)){
                ValidationAlerts.showErrorAlert(self,"email type is wrong")
            }else{
                let user = RegisterInfo(name: name, email: email, password:password)
                createANewUser(registerInfo: user)
            }
        }
        
    }
}

