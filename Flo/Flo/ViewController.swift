//
//  ViewController.swift
//  Flo
//
//  Created by Darya on 27.11.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
  
    var textLabelSort: [String] = ["Все советы","Новое","Сохраненное"]
    var textlabelImage: [String] = ["Ранние признаки беременности","О чем говорят женщины", "Как поддержать гигиену","Как задержать менопаузу"]
    var textlabelImage1: [String] = ["Беременность или ПМС","Нужны ли средства гигиены", "Советы по зачатию"]
    var textlabelImage2: [String] = ["Ванны во время беременности","Первые шевеления малыща", "Как правильно подобрать белье","Самомассаж во время лактостаза"]
    var items: [UIImage] = [.flo0, .flo1,.flo2, .flo3]
    var items1: [UIImage] = [.flo4, .flo5,.flo6]
    var items2: [UIImage] = [.flo7, .flo8,.flo9, .flo10]
    lazy var collectionView = UICollectionView (frame: .zero,
                                                collectionViewLayout: getCompositionalLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        title = "Статьи"
        navigationItem.rightBarButtonItem = .init(title: nil, image: .init(systemName: "bell"), target: nil, action: nil)
        navigationItem.leftBarButtonItem = .init(title: nil, image: .init(systemName: "person"), target: nil, action: nil)

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(1/20))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.interItemSpacing = .fixed(30)
                let layoutSection = NSCollectionLayoutSection(group: group)
                layoutSection.interGroupSpacing = 8
                layoutSection.contentInsets = .init(top: 10, leading: 12, bottom: 10, trailing: 12)
                layoutSection.orthogonalScrollingBehavior = .continuous
                return layoutSection
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                      heightDimension: .fractionalHeight(1/1.1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/1.2),
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
            switch indexPath.section {
            case 0:
                let cellSort = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellSort.id, for: indexPath) as! CollectionViewCellSort
                cellSort.labelSort.text = textLabelSort[indexPath.row]
                return cellSort
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
                cell.imageView.image = items[indexPath.item]
                cell.labelImage.text = textlabelImage[indexPath.row]
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
                cell.imageView.image = items1[indexPath.row]
                cell.labelImage.text = textlabelImage1[indexPath.row]
                return cell
            case 3:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
                cell.imageView.image = items2[indexPath.row]
                cell.labelImage.text = textlabelImage2[indexPath.row]
                
                return cell
            default:
                fatalError()
            
            }
        }
        
        

}
