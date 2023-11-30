//
//  NoteDetailViewController.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/30.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    let notesDetailScreen = NoteDetailScreenView()
    
    var note: noteInfo!
    
    override func loadView() {
        view = notesDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        notesDetailScreen.paragraphTextView.text = note.text

    }
    
}
