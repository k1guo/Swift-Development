//
//  SignUpScreen.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import UIKit

class SignUpScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var labelCreateAccount: UILabel!
    var textFieldName:UITextField!
    var textFieldEmail:UITextField!
    var textFieldPassword:UITextField!
    var buttonSignUp:UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupLabelCreateAccount()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupButtonSignUp()

        initConstraints()
    }
    func setupLabelCreateAccount(){
        labelCreateAccount = UILabel()
        labelCreateAccount.text = "Creat Account"
        labelCreateAccount.font = UIFont.boldSystemFont(ofSize: 35)
        labelCreateAccount.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCreateAccount)
    }
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.borderStyle = .roundedRect
        textFieldName.placeholder = "Name"
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.placeholder = "Email"
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.placeholder = "Password"
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    func setupButtonSignUp(){
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelCreateAccount.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 32),
            labelCreateAccount.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo:labelCreateAccount.bottomAnchor,constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            textFieldEmail.topAnchor.constraint(equalTo:textFieldName.bottomAnchor,constant: 32),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            textFieldPassword.topAnchor.constraint(equalTo:textFieldEmail.bottomAnchor,constant: 32),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            buttonSignUp.topAnchor.constraint(equalTo:textFieldPassword.bottomAnchor,constant: 52),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
    

}
