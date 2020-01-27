//
//  HeaderCollectionViewCell.swift
//  CollectionViewProgrammatically
//
//  Created by mcs on 1/27/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderViews()
    }

    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Today"
        title.textColor = .white
        title.font = UIFont(name: "Montserrat", size: 50)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    func setupHeaderViews()   {
        addSubview(titleLabel)

        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        dateLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
