import UIKit
import Kingfisher

class CategoryDetailTableViewCell: UITableViewCell{
     let jobTitle = UILabel()
     let jobRequirements = UILabel()
    
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
        jobRequirementsCell()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            jobTitle.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            jobTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            jobTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            jobRequirements.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 4),
            jobRequirements.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            jobRequirements.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            jobRequirements.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -12)
        ])
    }
   
    private func jobTitleCell(){
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = .boldSystemFont(ofSize: 20)
        jobTitle.textColor = .black
        jobTitle.numberOfLines = 0
        addSubview(jobTitle)
    }
    
     private func jobRequirementsCell(){
        jobRequirements.translatesAutoresizingMaskIntoConstraints = false
        jobRequirements.font = .systemFont(ofSize: 16)
        jobRequirements.textColor = .black
        addSubview(jobRequirements)
    }
    
    func setCellValue(model: DatumAttributes){
        self.jobTitle.text = model.title
        self.jobRequirements.text = "Requerimientos del Cargo: \(model.description)"
    }
}
