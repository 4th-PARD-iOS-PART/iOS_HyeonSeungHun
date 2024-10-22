//
//  ThirdViewCell.swift
//  3rd_hw_HyeonSeungHun
//
//  Created by 현승훈 on 10/4/24.
//

import UIKit

class ThirdViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    let remindMe: UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 5
            config.imagePlacement = .top

            if let image = UIImage(named: "Bell"){
                let size = CGSize(width: 24, height: 24)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var textButton = AttributedString.init("Remind Me")
            textButton.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
            config.attributedTitle = textButton
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let shareButton: UIButton = {
               var config = UIButton.Configuration.filled()
               config.background.backgroundColor = .clear
               config.imagePadding = 5
               config.imagePlacement = .top
               if let image = UIImage(named: "share") {
                   let size = CGSize(width: 24, height: 24)
                   UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                   image.draw(in: CGRect(origin: .zero, size: size))
                   let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                   UIGraphicsEndImageContext()
                   config.image = scaledImage
               }
            var textButton = AttributedString.init("Share")
            textButton.font = .systemFont(ofSize: 11.0, weight: .regular)
            config.attributedTitle = textButton
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
           }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let scriptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "thirdViewCell")
        backgroundColor = .black

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(mainImage)
        contentView.addSubview(scriptLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(remindMe)
        contentView.addSubview(shareButton)

        // 여기서 UI 요소들의 레이아웃 설정을 추가하세요.
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 200),
                        
            remindMe.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            remindMe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 227),

            shareButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: remindMe.trailingAnchor , constant: 24),
                        
            dateLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 73),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                        
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor , constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant:  12),
                        
            scriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            scriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  12),
                      
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
}
