//
//  NoteDetailScreenView.swift
//  WA7_<Guo>_<7669>
//
//  Created by 郭 on 2023/11/30.
//

import UIKit

class NoteDetailScreenView: UIView {
    var paragraphTextView: UILabel!
    var contentWrapper: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupContentWrapper()
        setupParagraphView()
        initConstraints()
    }
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    func setupParagraphView() {
        paragraphTextView = UILabel()
        paragraphTextView.translatesAutoresizingMaskIntoConstraints = false
        paragraphTextView.numberOfLines = 0
        contentWrapper.addSubview(paragraphTextView)
    }
    func initConstraints() {
        NSLayoutConstraint.activate([
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            //MARK: paragraphTextView constraints...
            paragraphTextView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, constant: -20),
            paragraphTextView.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            paragraphTextView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 20),
            paragraphTextView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -20),
            paragraphTextView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -20)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
