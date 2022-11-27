//
//  ViewController.swift
//  ListView
//
//  Created by Zardasht on 11/27/22.
//

import UIKit
 
class ViewController: UIViewController {
    //Number of section
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section,Int>! = nil
    var collectionView: UICollectionView! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.backgroundColor = .black
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.identifier)
        view.addSubview(collectionView)
    }
    //MARK: - CreateLayout
    private func createLayout() -> UICollectionViewLayout {
        //Fill 100% both directions
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //Fill 100% Wide and Height 44pts
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        
        //here we are saying make two columns Horizontal count 2
        //Even thought the itemSize say - make me 1:1 the group layout ovverirde that and makes it
        //Stretch to something longer , so group overrides item.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    //MARK: - Configure DataSource
    private func configureDataSource() {
        //Create diffable Datasource and connect to collectionView
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            //A constructor that passes the collection view as input , and return a cell as output
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.identifier, for: indexPath) as? TextCell else { fatalError("Cannot create new cell")}
            cell.label.text = "\(itemIdentifier)"
            cell.contentView.backgroundColor = .systemBlue
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
            return cell
        })
        
        //initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section,Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<94))
        dataSource.apply(snapshot,animatingDifferences: true)
    }
}

