
//  Created by Darya on 28.11.23.
//
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell"
    
    let imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelImage = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelSort = {
        let lebelSort = UILabel()
        lebelSort.translatesAutoresizingMaskIntoConstraints = false
        return lebelSort
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(labelImage)
        contentView.addSubview(labelSort)
    
        
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelImage.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8),
            labelImage.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 8),
            labelImage.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
            
        ])
       
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



