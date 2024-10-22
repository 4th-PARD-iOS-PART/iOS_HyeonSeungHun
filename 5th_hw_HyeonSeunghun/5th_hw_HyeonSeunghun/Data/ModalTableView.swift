
import UIKit

class ModalTableView : UITableViewCell {
    
    let cellImage : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cellTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12 ,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellTimeLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5490196347, green: 0.5490196347, blue: 0.5490196347, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10 ,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellScriptLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "modalTable")
        contentView.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        contentView.addSubview(cellImage)
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(cellTimeLabel)
        contentView.addSubview(cellScriptLabel)
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant: 16),
            cellImage.widthAnchor.constraint(equalToConstant: 124),
            cellImage.heightAnchor.constraint(equalToConstant: 69),

            cellScriptLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor ,constant: 8),
            cellScriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            cellTitleLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 8),
            cellTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.5),
            
            cellTimeLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant:8 ),
            cellTimeLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor),
            
        ])
    }
}
