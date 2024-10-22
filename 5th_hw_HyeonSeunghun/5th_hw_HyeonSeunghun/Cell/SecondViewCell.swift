//
//  cell.swift
//  3rd_hw_HyeonSeungHun
//
//  Created by 현승훈 on 10/2/24.
//

import UIKit

class SecondViewCell : UITableViewCell {
    
    let cellLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let cellPlayImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cellImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "secondCell")
        setUI()
        contentView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
    }
    
    func setUI(){
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellPlayImage)
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.widthAnchor.constraint(equalToConstant: 146),
            
  
            cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 7),
        
            cellPlayImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellPlayImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -3),
            cellPlayImage.widthAnchor.constraint(equalToConstant: 28),
            cellPlayImage.heightAnchor.constraint(equalToConstant: 28),
            
            
            
        ])
    }
    
}
