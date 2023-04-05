import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    private var nameOfCategory = UILabel()
    private let imageIcon = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        imageSetup()
        nameCategoryCell()
        categoryCellConstraints()
    }
    
    private func categoryCellConstraints(){
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            imageIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageIcon.heightAnchor.constraint(equalToConstant: 30),
            imageIcon.widthAnchor.constraint(equalToConstant: 30),
            nameOfCategory.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameOfCategory.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 12),
            nameOfCategory.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    private func nameCategoryCell(){
        nameOfCategory.font = .boldSystemFont(ofSize: 18)
        nameOfCategory.textColor = .black
        nameOfCategory.translatesAutoresizingMaskIntoConstraints = false
        nameOfCategory.numberOfLines = 0
        nameOfCategory.contentMode = .scaleAspectFit
        addSubview(nameOfCategory)
    }
    
    private func imageSetup(){
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.contentMode = .scaleAspectFit
        imageIcon.layer.cornerRadius = 15
        imageIcon.clipsToBounds = true
        addSubview(imageIcon)
    }
    
    func setCellCategoryValue(model: Attributes){
        self.nameOfCategory.text = model.name
        self.imageIcon.image = UIImage(systemName: "chevron.right")
        self.imageIcon.tintColor = AppColors.blueCustomColor
    }
}
