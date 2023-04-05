import UIKit
import Kingfisher

class CategoryDetailTableViewCell: UITableViewCell{
    private let jobTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        jobTitleCell()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            jobTitle.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            jobTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            jobTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            jobTitle.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -12)
        ])
    }
    
    private func jobTitleCell(){
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = .boldSystemFont(ofSize: 20)
        jobTitle.textColor = .black
        jobTitle.numberOfLines = 0
        addSubview(jobTitle)
    }
    
    func setCellValue(model: DatumAttributes){
        self.jobTitle.text = model.title
    }
}
