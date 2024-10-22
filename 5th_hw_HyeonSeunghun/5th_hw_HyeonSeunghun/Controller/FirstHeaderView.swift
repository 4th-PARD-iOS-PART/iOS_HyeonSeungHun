//
//  FirstHeaderView.swift
//  5th_hw_HyeonSeunghun
//
//  Created by 현승훈 on 10/21/24.
//

import UIKit

class FirstHeaderView: UIView{
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let UIStack : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "netflix")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerbutton1 : UIButton = {
        let TVShowButton = UIButton()
        TVShowButton.setTitle("TV Shows", for: .normal)
        TVShowButton.layer.borderColor = UIColor.white.cgColor
        TVShowButton.translatesAutoresizingMaskIntoConstraints = false
        return TVShowButton
    }()
    
    let headerbutton2 : UIButton = {
        let Movies = UIButton()
        Movies.setTitle("Movies", for: .normal)
        Movies.layer.borderColor = UIColor.white.cgColor
        Movies.translatesAutoresizingMaskIntoConstraints = false
        return Movies
    }()
    
    let headerbutton3 : UIButton = {
        let MyList = UIButton()
        MyList.setTitle("My List", for: .normal)
        MyList.layer.borderColor = UIColor.white.cgColor
        MyList.translatesAutoresizingMaskIntoConstraints = false
        return MyList
    }()
    
    let playButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.lightGray
        config.title = "Play"
        config.image = UIImage(named: "play")
        config.imagePadding = 15
        config.titlePadding = 15
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.baseForegroundColor = .black
        let playbutton = UIButton(configuration: config)
        playbutton.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .bold)
        playbutton.translatesAutoresizingMaskIntoConstraints = false
        return playbutton
    }()
    
    
    let infoButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "info"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("Info")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 14 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    let myListButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            if let image = UIImage(named: "plus"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                config.image = scaledImage
            }
            var text = AttributedString.init("My List")
            text.foregroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 15 , weight: .light)
            config.attributedTitle = text
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
            
        }()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI(){
            self.addSubview(mainImageView)
            self.addSubview(UIStack)
            UIStack.addSubview(logoImageView)
            UIStack.addSubview(headerbutton1)
            UIStack.addSubview(headerbutton2)
            UIStack.addSubview(headerbutton3)
            self.addSubview(myListButton)
            self.addSubview(playButton)
            self.addSubview(infoButton)

        
        NSLayoutConstraint.activate([
                    
                    
            UIStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            UIStack.topAnchor.constraint(equalTo: self.topAnchor),
                    
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    
                    logoImageView.leadingAnchor.constraint(equalTo: UIStack.leadingAnchor, constant: 20),
                    logoImageView.topAnchor.constraint(equalTo: UIStack.topAnchor, constant: 12),
                    logoImageView.widthAnchor.constraint(equalToConstant: 20),
                    logoImageView.heightAnchor.constraint(equalToConstant: 39),
                    
                    headerbutton1.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
                    headerbutton1.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor ,constant: 23 ),
                    
                    headerbutton2.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
                    headerbutton2.leadingAnchor.constraint(equalTo: headerbutton1.trailingAnchor, constant: 40),
                    
                    headerbutton3.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
                    headerbutton3.leadingAnchor.constraint(equalTo: headerbutton2.trailingAnchor, constant: 40),
                    headerbutton3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),

                    myListButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 52),
                    myListButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 324),
                
                    playButton.widthAnchor.constraint(equalToConstant: 134),
                    playButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 324),
                    playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    infoButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 324),
                    infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64),

                ])

    }
}
