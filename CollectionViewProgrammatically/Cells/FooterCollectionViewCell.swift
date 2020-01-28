//
//  FooterCollectionViewCell.swift
//  CollectionViewProgrammatically
//
//  Created by mcs on 1/27/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import UIKit

class FooterCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupFooterViews()
    }

    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Footer 🦵"
        title.textColor = .white
        title.font = UIFont(name: "Montserrat", size: 50)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    func setupFooterViews()   {
        addSubview(titleLabel)

        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
