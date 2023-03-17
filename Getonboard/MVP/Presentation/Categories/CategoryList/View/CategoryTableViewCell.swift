import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private var nameOfCategory = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        nameCategoryCell()
        categoryCellConstraints()
    }
    
    private func categoryCellConstraints(){
        NSLayoutConstraint.activate([
            nameOfCategory.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            nameOfCategory.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameOfCategory.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    private func nameCategoryCell(){
        nameOfCategory.font = .boldSystemFont(ofSize: 20)
        nameOfCategory.textColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
        nameOfCategory.translatesAutoresizingMaskIntoConstraints = false
        nameOfCategory.numberOfLines = 0
        addSubview(nameOfCategory)
    }
    
    func setCellCompanyValue(model: Attributes){
        self.nameOfCategory.text = model.name
    }
}

