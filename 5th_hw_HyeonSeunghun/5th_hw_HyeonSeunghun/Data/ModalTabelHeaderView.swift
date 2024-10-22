
import UIKit


class ModalTabelHeaderViewCell : UITableViewCell {

    let mainImage : UIImageView = {
       let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = .scaleAspectFill//이미지 비율 유지
        mainImage.clipsToBounds = true // imageView의 공간 밖을 넘어가지 않게
        return mainImage
    }()
    
    // 미러링 버튼
    let mirrorButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = #colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)
        
        if let image = UIImage(named: "monitor"){
            let size = CGSize(width: 18, height: 18)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            config.image = scaledImage
        }
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true // bound 밖으로 나가지 않게 조절
        button.layer.cornerRadius = 14
        return button
        
    }()
    
    // x 버튼 만들기
    let xButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = #colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)
        
        if let image = UIImage(named: "close"){
            let size = CGSize(width: 16, height: 16)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            config.image = scaledImage
        }
    
        let button = UIButton(configuration: config)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 넷플릭스 로고
    let logo : UIImageView = {
       let logo = UIImageView()
        logo.image = UIImage(named: "netflix")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.clipsToBounds = true
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    // 시리즈 라벨
    let series : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "S E R I E S"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = #colorLiteral(red: 0.717647016, green: 0.717647016, blue: 0.717647016, alpha: 1)
        return label
    }()
    
    // 타이틀
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selling Sunset"
        label.font = UIFont.systemFont(ofSize: 16 , weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // 정보
    let yearLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11 , weight: .medium)
        label.textColor = .white
        label.text = "2022"
        return label
    }()

    let tvma : UIImageView = {
        let tvma = UIImageView()
        tvma.translatesAutoresizingMaskIntoConstraints = false
        tvma.image = UIImage(named: "tvma")
        return tvma
    }()
    
    let season : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        label.text = "5 Seasons"
        return label
    }()
    
    let vision : UIImageView = {
       let vision = UIImageView()
        vision.translatesAutoresizingMaskIntoConstraints = false
        vision.image = UIImage(named: "Vision")
        return vision
    }()
    
    let hd : UIImageView = {
       let hd = UIImageView()
        hd.translatesAutoresizingMaskIntoConstraints = false
        hd.image = UIImage(named: "HD")
        return hd
    }()

    let ad : UIImageView = {
       let ad = UIImageView()
        ad.translatesAutoresizingMaskIntoConstraints = false
        ad.image = UIImage(named: "AD")
        return ad
    }()

    let playButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.white
        config.image = UIImage(named: "modal_play")
        config.imagePadding = 8
        config.attributedTitle = AttributedString("Play",attributes: AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]))
    
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 다운로드 버튼
    let downloadButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = #colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)
        config.image = UIImage(named: "download")
        config.imagePadding = 8
        config.attributedTitle = AttributedString("Download",attributes: AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .medium),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        ]))
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 부제
    let subTitle : UILabel = {
       let label = UILabel()
        label.text = "S5:E10 Nothing Remains The Same"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12 , weight:.bold )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 설명
    let subtext : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.text = "Heart flip as Heather weds Tarek. Jason and Mary grapole with\n being ghosted. Go solo or take the next step: The agents face lift-\n changing decisions. "
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // myList에 추가
    let mylistButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 5
        config.imagePlacement = .top
    
        if let image = UIImage(named: "plus"){
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            config.image = scaledImage
        }
            // configuration 에서 label 추가하는 방법 1.
        config.attributedTitle = AttributedString("Mylist", attributes: AttributeContainer([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight:  .light ),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        ]))
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //  따봉 버튼
    let rateButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePlacement = .top
        config.imagePadding = 5
        
        if let image = UIImage(named: "good"){
            let size = CGSize(width: 26, height: 26)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            
            config.image = scaledImage
            
        }
        //configuration 에서 label 추가하는 방법 2.
        var text = AttributedString.init("Rate")
        text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 10, weight: .light)
        config.attributedTitle = text
    
        let button  = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 공유
    let shareButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 6
        config.imagePlacement = .top
    
        if let image = UIImage(named: "modal-share"){
            let size = CGSize(width: 26, height: 26)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
            UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
            config.image = scaledImage
        }
        // 라벨 추가
        var text = AttributedString.init("Share")
        text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 10 , weight: .light)
        config.attributedTitle = text
        
        // config 버튼에 합치기
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // 탭바 이미지
    let tabBarImage : UIImageView = {
       let tabimage = UIImageView()
        tabimage.image = UIImage(named: "tabBar")
        tabimage.translatesAutoresizingMaskIntoConstraints = false
        tabimage.contentMode = .scaleAspectFit
        return tabimage
    }()

    // 시즌 토글 라벨
    let SeasonImage : UIImageView = {
       let seasonimage = UIImageView()
        seasonimage.image = UIImage(named: "Season5")
        seasonimage.translatesAutoresizingMaskIntoConstraints = false
        seasonimage.contentMode = .scaleAspectFit
        return seasonimage
    }()
    
    // 시즌 토글 이미지
    let toggleImage : UIImageView = {
       let toggleImage = UIImageView()
        toggleImage.contentMode = .scaleAspectFit
        toggleImage.image = UIImage(named: "toggle")
        toggleImage.translatesAutoresizingMaskIntoConstraints = false
        return toggleImage
    }()
    
    
    //MARK: - main
    required init?(coder: NSCoder) {
        fatalError()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "tableHeaderView")
        setUI()
        xButton.addTarget(self, action: #selector(xButtonTapped), for: .touchUpInside)
        contentView.backgroundColor = .black
    }
    
    func setUI(){
        contentView.addSubview(mainImage)
        contentView.addSubview(mirrorButton)
        contentView.addSubview(xButton)
        contentView.addSubview(series)
        contentView.addSubview(logo)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(tvma)
        contentView.addSubview(season)
        contentView.addSubview(vision)
        contentView.addSubview(season)
        contentView.addSubview(hd)
        contentView.addSubview(ad)
        contentView.addSubview(playButton)
        contentView.addSubview(downloadButton)
        contentView.addSubview(subTitle)
        contentView.addSubview(subtext)
        contentView.addSubview(mylistButton)
        contentView.addSubview(rateButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(tabBarImage)
        contentView.addSubview(SeasonImage)
        contentView.addSubview(toggleImage)
    
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 210),
            
            mirrorButton.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 25),
            mirrorButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -50),
            mirrorButton.widthAnchor.constraint(equalToConstant: 28),
            mirrorButton.heightAnchor.constraint(equalToConstant: 28),
            
            xButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            xButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10),
            xButton.widthAnchor.constraint(equalToConstant: 28),
            xButton.heightAnchor.constraint(equalToConstant: 28),
            
            logo.topAnchor.constraint(equalTo: mainImage.bottomAnchor , constant: 11),
            logo.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor , constant: 8),
            logo.widthAnchor.constraint(equalToConstant: 25),
            logo.heightAnchor.constraint(equalToConstant: 25),
            
            series.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 15),
            series.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 0),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant:  0),
            
            yearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            
            tvma.leadingAnchor.constraint(equalTo: yearLabel.trailingAnchor, constant: 4),
            tvma.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            
            season.leadingAnchor.constraint(equalTo: tvma.trailingAnchor, constant: 4),
            season.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            
            vision.leadingAnchor.constraint(equalTo: season.trailingAnchor, constant: 4),
            vision.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            
            hd.leadingAnchor.constraint(equalTo: vision.trailingAnchor ,constant: 4),
            hd.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9.5),
            
            ad.leadingAnchor.constraint(equalTo: hd.trailingAnchor , constant: 4),
            ad.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 8),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            playButton.topAnchor.constraint(equalTo: vision.bottomAnchor, constant: 11),
            playButton.heightAnchor.constraint(equalToConstant: 34),
            
            downloadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 8),
            downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 8),
            downloadButton.heightAnchor.constraint(equalToConstant: 34),

            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            subTitle.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 14),
            
            subtext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            subtext.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 4),
            
            mylistButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 31),
            mylistButton.topAnchor.constraint(equalTo: subtext.bottomAnchor, constant: 32),
            
            rateButton.leadingAnchor.constraint(equalTo: mylistButton.trailingAnchor ,constant: 56),
            rateButton.topAnchor.constraint(equalTo: subtext.bottomAnchor, constant: 32),
            
            shareButton.leadingAnchor.constraint(equalTo:rateButton.trailingAnchor ,constant: 56),
            shareButton.topAnchor.constraint(equalTo: subtext.bottomAnchor, constant: 32),
            
            tabBarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 16),
            tabBarImage.topAnchor.constraint(equalTo: mylistButton.bottomAnchor, constant: 36),
            tabBarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34),
            
            SeasonImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            SeasonImage.topAnchor.constraint(equalTo: tabBarImage.bottomAnchor, constant: 31),
            
            SeasonImage.leadingAnchor.constraint(equalTo: SeasonImage.trailingAnchor, constant: 10),
            SeasonImage.topAnchor.constraint(equalTo: tabBarImage.bottomAnchor, constant: 38),
            SeasonImage.widthAnchor.constraint(equalToConstant: 8),
            SeasonImage.heightAnchor.constraint(equalToConstant: 4),
        ])
    }
}

//MARK: -  모달창 닫기
extension ModalTabelHeaderViewCell {
    @objc func xButtonTapped(){
        NotificationCenter.default.post(name: NSNotification.Name("CloseModalNotification"), object: nil)
    }
}
