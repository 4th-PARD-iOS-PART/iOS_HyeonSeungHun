//
//  cell.swift
//  3rd_hw_HyeonSeungHun
//
//  Created by 현승훈 on 10/2/24.
//

import UIKit

class SecondViewCell: UITableViewCell {
   
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
   
    let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
   
    let cellPlayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .darkGray
        setupUI()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setupUI() {
        addSubview(cellLabel)
        addSubview(cellImage)
        addSubview(cellPlayImage)
       
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
//          cellImage.centerYAnchor.constraint(equalTo: centerYAnchor),
//            cellImage.widthAnchor.constraint(equalToConstant: 100),
//            cellImage.heightAnchor.constraint(equalToConstant: 100),
           
            cellLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 15),
            cellLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
           
            cellPlayImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellPlayImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellPlayImage.widthAnchor.constraint(equalToConstant: 24),
            cellPlayImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
