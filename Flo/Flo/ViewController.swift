//
//  ViewController.swift
//  Flo
//
//  Created by Darya on 27.11.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
  
    var account = {
        var account = UIImageView()
        account.image =  UIImage(systemName: "person")
    return account
    }()
    let reminder = {
        let reminder = UIImageView()
        reminder.image = UIImage(systemName: "bell")
    return reminder
    }()
    
    var textLabelSort: [String] = ["Все советы","Новое","Сохраненное"]
    var textlabelImage: [String] = ["Ранние признаки беременности","О чем говорят женщины", "Как поддержать гигиену","Как задержать менопаузу"]
    var items: [UIImage] = []
    lazy var collectionView = UICollectionView (frame: .zero,
                                                collectionViewLayout: getCompositionalLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        self.title = "Статьи"
        view.addSubview(account)
        view.addSubview(reminder)
        view.addSubview(collectionView)
    
        account.translatesAutoresizingMaskIntoConstraints = false
        account.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10).isActive = true
        account.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        reminder.translatesAutoresizingMaskIntoConstraints = false
        reminder.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10).isActive = true
        reminder.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        
        for item in 0...3 {
            items.append(UIImage(named: "flo\(item)")!)
        }
        
       
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        collectionView.register(CollectionViewCellSort.self, forCellWithReuseIdentifier: CollectionViewCellSort.id)
        
    }
    
    
    func getCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section, evironment) -> NSCollectionLayoutSection? in
            if section == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1/20))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.interItemSpacing = .fixed(8)
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 8
                layoutSection.contentInsets = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
                layoutSection.orthogonalScrollingBehavior = .continuous
                return layoutSection
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2.1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/1.1),
                                                       heightDimension: .fractionalHeight(1/3.5))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.interItemSpacing = .fixed(8)
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 8
                layoutSection.contentInsets = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
                layoutSection.orthogonalScrollingBehavior = .continuous
                return layoutSection
            
            }
        }
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath)
        }
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 4
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            switch section {
            case 0:
                return textLabelSort.count
            case 1:
                return 4
            case 2:
                return 3
            case 3:
                return 4
            default:
                fatalError()
            }
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.section == 0 {
                let cellSort = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellSort.id, for: indexPath) as! CollectionViewCellSort
                cellSort.labelSort.text = textLabelSort[indexPath.row]
                return cellSort
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
                cell.imageView.image = items[indexPath.row]
                cell.labelImage.text = textlabelImage[indexPath.row]
                return cell
            
            }
        }
        
        
    
}
