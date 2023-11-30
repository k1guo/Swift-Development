//
//  AddNoteView.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/29.
//

import UIKit

class AddNoteScreenView: UIView {
    var noteText: UITextView!
    var placeholderLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupNoteText()
        setupPlaceholderLabel()
        initConstraints()
    }
    
    // MARK: Setting up UI elements...
    func setupNoteText() {
        noteText = UITextView()
        noteText.translatesAutoresizingMaskIntoConstraints = false
        noteText.delegate = self
        addSubview(noteText)
    }
    
    func setupPlaceholderLabel() {
        placeholderLabel = UILabel()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.font = UIFont.boldSystemFont(ofSize: 30)
        placeholderLabel.text = "Enter your note here..."
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = noteText.font
        addSubview(placeholderLabel)
    }
    func initConstraints() {
        NSLayoutConstraint.activate([
            // MARK: noteText constraints...
            noteText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            noteText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            noteText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            noteText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            // MARK: placeholderLabel constraints...
            placeholderLabel.topAnchor.constraint(equalTo: noteText.topAnchor, constant: 4),
            placeholderLabel.leadingAnchor.constraint(equalTo: noteText.leadingAnchor, constant: 4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddNoteScreenView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
