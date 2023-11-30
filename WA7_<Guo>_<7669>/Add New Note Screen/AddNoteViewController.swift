//
//  AddNoteViewController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/29.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    let addANoteScreen = AddNoteScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    var authToken = String()
    
    override func loadView() {
        view = addANoteScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(onSaveButtonTapped)
        )
    }
    
    @objc func onSaveButtonTapped(){
        if let text = addANoteScreen.noteText.text{
            if text.isEmpty{
                print("error")
                ValidationAlerts.showErrorAlert(self, "notes can not be empty")
            }else{
                self.addANewNote(key: authToken, text: text)
            }
        }
    }

}
