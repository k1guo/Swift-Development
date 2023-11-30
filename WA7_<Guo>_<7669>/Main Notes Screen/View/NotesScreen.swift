//
//  NotesScreen.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/10/26.
//

import UIKit

class NotesScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var labelDisplayNotes:UILabel!
    var contentWrapper:UIScrollView!
    var tableViewNotes: UITableView!
    var floatingButtonAddNote: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelDisplayNotes()
        setupContentWrapper()
        setupTableViewNotes()
        setupFloatingButtonAddNote()

        initConstraints()
    }

    func setupLabelDisplayNotes(){
        labelDisplayNotes = UILabel()
        labelDisplayNotes.text = "My Notes"
        labelDisplayNotes.font = UIFont.boldSystemFont(ofSize: 35)
        labelDisplayNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDisplayNotes)
    }
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setupTableViewNotes(){
        tableViewNotes = UITableView()
        tableViewNotes.register(NoteTableViewCell.self, forCellReuseIdentifier: "notes")
        tableViewNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewNotes)
    }
    func setupFloatingButtonAddNote(){
        floatingButtonAddNote = UIButton(type: .system)
        floatingButtonAddNote.setTitle("", for: .normal)
        floatingButtonAddNote.setImage(UIImage(systemName: "note.text.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonAddNote.contentHorizontalAlignment = .fill
        floatingButtonAddNote.contentVerticalAlignment = .fill
        floatingButtonAddNote.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddNote.layer.cornerRadius = 16
        floatingButtonAddNote.imageView?.layer.shadowOffset = .zero
        floatingButtonAddNote.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddNote.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddNote.imageView?.clipsToBounds = true
        floatingButtonAddNote.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddNote)
    }
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelDisplayNotes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            labelDisplayNotes.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            tableViewNotes.topAnchor.constraint(equalTo: labelDisplayNotes.bottomAnchor, constant: 32),
            tableViewNotes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewNotes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tableViewNotes.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            floatingButtonAddNote.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonAddNote.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonAddNote.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddNote.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
