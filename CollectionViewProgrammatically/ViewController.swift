//
//  ViewController.swift
//  CollectionViewProgrammatically
//
//  Created by mcs on 1/27/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 80, bottom: 20, right: 80)
        layout.headerReferenceSize = CGSize(width: 100, height: 75)
        layout.footerReferenceSize = CGSize(width: 150, height: 75)

        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .blue // blue sea
        
        return cv
    }()
    
    let teslaImages = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Tesla_Model_S_Japan_trimmed.jpg/1200px-Tesla_Model_S_Japan_trimmed.jpg",
        "https://car-images.bauersecure.com/pagefiles/27525/teslamodel3-001.jpg",
 "https://cdn.yankodesign.com/images/design_news/2019/11/teslas-cybertruck-is-perhaps-the-most-advanced-worst-designed-truck-in-modern-automotive-history/tesla_cybertruck_12.jpg",
        "https://360view.hum3d.com/zoom/Tesla/Tesla_Cyberquad_ATV_2019_1000_0001.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        collectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.register(HeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerID")
        collectionView.register(FooterCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerID")
        
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teslaImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CarCollectionViewCell
        
        cell.backgroundColor = UIColor.green
        cell.imageView.downloadImageFrom(link: teslaImages[indexPath.row], contentMode: .scaleAspectFit)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: self.view.frame.height - 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! HeaderCollectionViewCell
            
            header.backgroundColor = UIColor.init(hex: "#d35400") // pumpkin
            
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerID", for: indexPath)

            footer.backgroundColor = UIColor.init(hex: "#d35400") // pumpkin
            
            return footer
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

