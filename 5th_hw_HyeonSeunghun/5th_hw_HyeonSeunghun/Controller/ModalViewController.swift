import UIKit

class ModalViewController: UIViewController {

    var titleText: String?
    var titleImage: UIImage?

    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setTable()
    }

    func setUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(closeModal), name: NSNotification.Name("CloseModalNotification"), object: nil)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(ModalTabelHeaderViewCell.self, forCellReuseIdentifier: "tableHeaderView")
        tableView.register(ModalTableView.self, forCellReuseIdentifier: "modalTable")
    }

    @objc func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - tableView extension
extension ModalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return ModalViewData.modalModeling.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableHeaderView", for: indexPath) as? ModalTabelHeaderViewCell else {
                return UITableViewCell()
            }

            cell.mainImage.image = titleImage
            cell.titleLabel.text = titleText
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "modalTable", for: indexPath) as? ModalTableView else { return UITableViewCell() }

        let data = ModalViewData.modalModeling[indexPath.row]
        cell.cellImage.image = UIImage(named: data.image)
        cell.cellTitleLabel.text = data.title
        cell.cellTimeLabel.text = data.time
        cell.cellScriptLabel.text = data.script
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 700 : 130
    }

    // cell 사이 간격 조정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 25
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding / 2)
        cell.layer.mask = maskLayer
    }
}
