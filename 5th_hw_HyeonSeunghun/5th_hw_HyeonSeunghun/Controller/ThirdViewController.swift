
import UIKit


class ThirdViewController : UIViewController{
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.font = UIFont.systemFont(ofSize: 16.91 , weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleImage : UIImageView = {
       let titleImage = UIImageView()
        titleImage.image = UIImage(named:"redBell")
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        return titleImage
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView ()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = . black
       return tableView
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        setTable()
        
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register( ThirdViewCell.self, forCellReuseIdentifier: "thirdViewCell")
    }
    
    
    func setUI(){
        view.addSubview(titleImage)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            titleImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
//            titleImage.widthAnchor.constraint(equalToConstant: 19),
//            titleImage.heightAnchor.constraint(equalToConstant: 19),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 7),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 26),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            ])
    }
}


//MARK: - tableView extension
extension ThirdViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "thirdViewCell", for: indexPath) as? ThirdViewCell else { return UITableViewCell() }
        
        cell.dateLabel.text =  ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].date
        cell.titleLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].title
        let imageName = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].thirdMainImage
        cell.mainImage.image = UIImage(named: imageName)
        cell.scriptLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].script
        cell.categoryLabel.text = ThirdViewData.thirdmodeling[indexPath.section][indexPath.row].category
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ThirdViewData.thirdmodeling.count

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
//
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let verticalPadding: CGFloat = -5
           let maskLayer = CALayer()
           maskLayer.backgroundColor = UIColor.black.cgColor
           maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
           cell.layer.mask = maskLayer
       }
//
    
    
}
