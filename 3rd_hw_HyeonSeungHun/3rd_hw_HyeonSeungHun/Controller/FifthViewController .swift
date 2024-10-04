import UIKit


class FifthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        
        let label4: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "hello"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            return label
        }()
        
        view.addSubview(label4)
        
        
        NSLayoutConstraint.activate([
            label4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label4.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

