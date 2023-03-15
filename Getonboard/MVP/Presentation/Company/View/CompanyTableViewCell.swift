import UIKit

class CompanyTableViewCell: UITableViewCell {
    
    private var nameOfCompany = UILabel()
    private let countryOfCompany = UILabel()
    private let logoOfCompany = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        companyIconCell()
        nameCompanyCell()
        countryCompanyCell()
        companyCellConstraints()
    }
    
    private func companyCellConstraints(){
        NSLayoutConstraint.activate([
            logoOfCompany.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            logoOfCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            logoOfCompany.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            logoOfCompany.widthAnchor.constraint(equalToConstant: 100),
            logoOfCompany.heightAnchor.constraint(equalToConstant: 100),
            nameOfCompany.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            nameOfCompany.leadingAnchor.constraint(equalTo: logoOfCompany.trailingAnchor, constant: 12),
            nameOfCompany.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            countryOfCompany.topAnchor.constraint(equalTo: nameOfCompany.bottomAnchor, constant: 12),
            countryOfCompany.leadingAnchor.constraint(equalTo: logoOfCompany.trailingAnchor, constant: 12)
        ])
    }
    
    private func companyIconCell(){
        logoOfCompany.contentMode = .scaleAspectFill
        logoOfCompany.translatesAutoresizingMaskIntoConstraints = false
        logoOfCompany.layer.cornerRadius = 50
        logoOfCompany.clipsToBounds = true
        addSubview(logoOfCompany)
    }
    
    private func nameCompanyCell(){
        nameOfCompany.font = .boldSystemFont(ofSize: 20)
        nameOfCompany.textColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
        nameOfCompany.translatesAutoresizingMaskIntoConstraints = false
        nameOfCompany.numberOfLines = 0
        addSubview(nameOfCompany)
    }
    
    private func countryCompanyCell(){
        countryOfCompany.font = .systemFont(ofSize: 20)
        countryOfCompany.textColor = .black
        countryOfCompany.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countryOfCompany)
    }
    
    func setCellCompanyValue(model: AttributesModel){
        self.nameOfCompany.text = model.name
        self.countryOfCompany.text = model.country
    }
}
