//
//  ProfileScreen.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/27.
//

import UIKit

class ProfileScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var labelTitle:UILabel!
    var labelId:UILabel!
    var labelName:UILabel!
    var labelEmail:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelTitle()
        setupLabelName()
        setupLabelId()
        setupLabelEmail()
        
        initConstraints()
    }
    func setupLabelTitle(){
        labelTitle = UILabel()
        labelTitle.text = "My Profile"
        labelTitle.font = UIFont.boldSystemFont(ofSize: 35)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTitle)
    }
    func setupLabelName(){
        labelName = UILabel()
        labelName.text = "My Profile"
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    func setupLabelId(){
        labelId = UILabel()
        labelId.text = "My Id"
        labelId.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelId)
    }
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.text = "My Profile"
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 32),
            labelTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor,constant: 102),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 62),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor,constant: 62),
            labelEmail.leadingAnchor.constraint(equalTo:labelName.leadingAnchor),
            
            labelId.topAnchor.constraint(equalTo: labelEmail.bottomAnchor,constant: 62),
            labelId.leadingAnchor.constraint(equalTo: labelName.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
