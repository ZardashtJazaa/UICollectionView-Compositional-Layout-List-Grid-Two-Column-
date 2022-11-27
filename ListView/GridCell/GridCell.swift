//
//  GridCell.swift
//  ListView
//
//  Created by Zardasht on 11/27/22.
//

import UIKit

//MARK: -Compositional Layout


//For making like Grid

//let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
//let item = NSCollectionLayoutItem(layoutSize: itemSize)
//item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
//let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//let section = NSCollectionLayoutSection(group: group)

//let layout = UICollectionViewCompositionalLayout(section: section)
//return layout


class TextCell: UICollectionViewCell {
    static let identifier = String(describing: TextCell.self)
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextCell {
    //Configure
    private func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
//        label.backgroundColor = .systemRed
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        ])
    }
}
