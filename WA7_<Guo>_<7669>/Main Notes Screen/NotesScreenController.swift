//
//  NotesScreenController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import UIKit
import Alamofire

class NotesScreenController: UIViewController {
    
    let notificationCenter = NotificationCenter.default

    let notesScreen = NotesScreen()
    
    var allNotes = [noteInfo]()
    
    let loginScreen = ViewController()
    
    var authToken = String()
    
    override func loadView() {
        view = notesScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesScreen.tableViewNotes.dataSource = self
        notesScreen.tableViewNotes.delegate = self
        notesScreen.tableViewNotes.separatorStyle = .none
        
        //MARK: get all notes by authToken
        getAllNotes(key: authToken)

        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItem?.title = "More"
        navigationItem.rightBarButtonItem?.menu = UIMenu(title: "Setting",
                                                         children: [
                                                             UIAction(title: "My Profile",handler: {(_) in
                                                                 self.showMyProfile()
                                                             }),
                                                             UIAction(title: "Log Out",handler: {(_) in
                                                                 self.userLogOut()
                                                             })
                                                         ])
        
        notificationCenter.addObserver(
            self,
            selector: #selector(onNewNoteAdded),
            name: .addedANewNote,
            object: nil
        )
        
        notesScreen.floatingButtonAddNote.addTarget(self, action: #selector(onAddNoteButtonTapped), for:.touchUpInside)
    }
    
    @objc func onNewNoteAdded(){
        getAllNotes(key: authToken)
    }
    
    //MARK: exit alert...
    func  userLogOut(){
        let alert = UIAlertController(title: "Exit Alert!", message: "Are you sure you want to exit the Notes ?", preferredStyle: .alert)

        let action = UIAlertAction(title:  "Yes", style: .cancel) { [] (action) in
            self.apiLogOut()
        }
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "No", style: .default))
        self.present(alert, animated: true)
    }
    
    //MARK: pop to my profile screen button
    func  showMyProfile(){
        let profileScreen = ProfileScreenController()
        profileScreen.authToken = authToken
        navigationController?.pushViewController(profileScreen, animated:true)
    }
    

    //MARK: Add new note button tapped...
    @objc func onAddNoteButtonTapped(){
        let addNewNoteViewController = AddNoteViewController()
        addNewNoteViewController.authToken = authToken
        navigationController?.pushViewController(addNewNoteViewController, animated: true)
    }
    
    //MARK: delete alert...
    func deleteSelectedFor(id:String,rowInt:Int){
        let deleteAlert = UIAlertController(title: "Delete Alert!", message: "Are you sure you want to delete the contact ?", preferredStyle: .alert)

        let deleteAction = UIAlertAction(title:  "Sure", style: .cancel) { [self] (action) in
            apiDeleteNote(id:id,rowInt:rowInt,key:authToken)
        }

        deleteAlert.addAction(deleteAction)
        deleteAlert.addAction(UIAlertAction(title: "Recall", style: .default))
        self.present(deleteAlert, animated: true)
    }
    
}





extension NotesScreenController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! NoteTableViewCell
        cell.labelName.text = self.allNotes[indexPath.row].text
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailViewController = NoteDetailViewController()
        noteDetailViewController.note = allNotes[indexPath.row]
        navigationController?.pushViewController(noteDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ action, view, completion   in
            
            //MARK: display the delete alert...
            let alert = UIAlertController(title: "Delete the note?", message: "Are you sure you want to delete the note?", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {_ in
                //MARK: delete note when the user confirms...
                self.deleteSelectedFor(id: self.allNotes[indexPath.row]._id, rowInt:  indexPath.row)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            self.present(alert, animated: true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}


