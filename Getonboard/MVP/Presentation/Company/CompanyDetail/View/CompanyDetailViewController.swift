import UIKit
import Kingfisher

class CompanyDetailViewController: UIViewController{
    
    var company : AttributesModel?
    private let nameOfCompany = UILabel()
    private let companyDescription = UILabel()
    private let titleDescription = UILabel()
    private let companyLogo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    private func initDetailViews(){
        nameOfCompanySetup()
        titleDescriptionSetup()
        companyDescriptionSetup()
        companyLogoSetup()
        companyDetailConstraints()
        setCompanyDescription()
    }
    
    private func companyDetailConstraints(){
        NSLayoutConstraint.activate([
            companyLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            companyLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            companyLogo.widthAnchor.constraint(equalToConstant: 100),
            companyLogo.heightAnchor.constraint(equalToConstant: 100),
            nameOfCompany.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameOfCompany.leadingAnchor.constraint(equalTo: companyLogo.trailingAnchor, constant: 16),
            nameOfCompany.centerYAnchor.constraint(equalTo: companyLogo.centerYAnchor),
            titleDescription.topAnchor.constraint(equalTo: companyLogo.bottomAnchor, constant: 30),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            companyDescription.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 30),
            companyDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            companyDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func nameOfCompanySetup(){
        nameOfCompany.translatesAutoresizingMaskIntoConstraints = false
        nameOfCompany.font = .boldSystemFont(ofSize: 25)
        nameOfCompany.textColor = AppColors.blueCustomColor
        nameOfCompany.textAlignment = .center
        nameOfCompany.numberOfLines = 0
        view.addSubview(nameOfCompany)
    }
    
    private func titleDescriptionSetup(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.font = .boldSystemFont(ofSize: 25)
        titleDescription.textColor = AppColors.blueCustomColor
        titleDescription.numberOfLines = 0
        titleDescription.text = "Descripción"
        view.addSubview(titleDescription)
    }
    
    private func companyDescriptionSetup(){
        companyDescription.translatesAutoresizingMaskIntoConstraints = false
        companyDescription.font = .systemFont(ofSize: 18)
        companyDescription.numberOfLines = 0
        companyDescription.textAlignment = .justified
        view.addSubview(companyDescription)
    }
    
    private func companyLogoSetup(){
        companyLogo.contentMode = .scaleAspectFill
        companyLogo.translatesAutoresizingMaskIntoConstraints = false
        companyLogo.layer.cornerRadius = 50
        companyLogo.clipsToBounds = true
        view.addSubview(companyLogo)
        }
    
    private func setCompanyDescription(){
        guard let company = company else {return}
        nameOfCompany.text.self = company.name
        companyDescription.text.self = company.description
        guard let url = URL(string: company.logo ) else {return}
        self.companyLogo.kf.setImage(with: url)
    }
}
