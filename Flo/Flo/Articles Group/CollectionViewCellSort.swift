//
//  CollectionViewCellSort.swift
//  Flo
//
//  Created by Darya on 29.11.23.
//

import UIKit

class CollectionViewCellSort: UICollectionViewCell {
    
    static let id = "CollectionViewCellSort"
    
    
    let labelSort = {
        var labelSort = UILabel()
        labelSort.translatesAutoresizingMaskIntoConstraints = false
        return labelSort
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(labelSort)
    
        
        NSLayoutConstraint.activate([

            labelSort.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelSort.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelSort.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelSort.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




