import UIKit


class FourthViewController: UIViewController{
    let downloadImage : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "large_download")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let downloadMessege: UILabel = {
            let downloadMessege = UILabel()
            downloadMessege.textColor =  .lightGray
            downloadMessege.translatesAutoresizingMaskIntoConstraints = false
            downloadMessege.text = "Movies and TV shows that you \n download appear here."
            downloadMessege.textAlignment = .center
            downloadMessege.numberOfLines = 2
            
            return downloadMessege
        }()
        
        let downloadButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .white
            config.attributedTitle = AttributedString("Find Something to Download",attributes: AttributeContainer([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]))
            config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 26)
            let downloadButton = UIButton(configuration: config)
            downloadButton.translatesAutoresizingMaskIntoConstraints = false
            return downloadButton
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black
            setUI()
        }
        
        func setUI(){
            view.addSubview(downloadImage)
            view.addSubview(downloadMessege)
            view.addSubview(downloadButton)
            
            
            NSLayoutConstraint.activate([
                
                downloadImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
                downloadImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                downloadMessege.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                downloadMessege.topAnchor.constraint(equalTo: downloadImage.bottomAnchor, constant: 32),
                
                downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                downloadButton.topAnchor.constraint(equalTo: downloadMessege.bottomAnchor, constant: 84),

                
                
            ])
        }
}
