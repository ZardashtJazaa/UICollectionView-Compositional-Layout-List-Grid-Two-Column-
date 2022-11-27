//
//  ListCell.swift
//  ListView
//
//  Created by Zardasht on 11/27/22.
//

import UIKit

//MARK: - ListCell
class ListCell: UICollectionViewCell {
    static let identifier = String(describing: ListCell.self)
    
    let label =  UILabel()
    let accessoryImageView = UIImageView()
    let seperatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    //StoryBoard Save the sate of our cell to disk back
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - ListCell + Extentions
extension ListCell {
    private func configure() {
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        //Make this label resizeable
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.addSubview(label)
        
        //SeperatorViwe
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.backgroundColor = .lightGray
        contentView.addSubview(seperatorView)
        
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        accessoryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(accessoryImageView)
        let rtl = effectiveUserInterfaceLayoutDirection == .rightToLeft
        let chevronImageView = rtl ? "chevron.left" : "chevron.right"
        let chevronImage = UIImage(systemName: chevronImageView)
        accessoryImageView.image = chevronImage
        accessoryImageView.tintColor = UIColor.lightGray.withAlphaComponent(0.7)
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            
            //Label
            label.topAnchor.constraint(equalTo: contentView.topAnchor,constant: inset),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            label.trailingAnchor.constraint(equalTo: accessoryImageView.leadingAnchor, constant: -inset),
            //AccessoryImageView
            accessoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            accessoryImageView.widthAnchor.constraint(equalToConstant: 13),
            accessoryImageView.heightAnchor.constraint(equalToConstant: 20),
            accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            //SeperatorView
            seperatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            seperatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            seperatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seperatorView.heightAnchor.constraint(equalToConstant: 0.5),
        ])
    }
    
}
