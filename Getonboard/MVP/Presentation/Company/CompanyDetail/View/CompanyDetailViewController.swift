import UIKit

class CompanyDetailViewController: UIViewController{
    
    var company : AttributesModel?
    private let nameOfCompany = UILabel()
    private let companyDescription = UILabel()
    private let titleDescription = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    private func initDetailViews(){
        nameOfCompanySetup()
        titleDescriptionSetup()
        companyDescriptionSetup()
        companyDetailConstraints()
        setCompanyDescription()
    }
    
    private func companyDetailConstraints(){
        NSLayoutConstraint.activate([
            nameOfCompany.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameOfCompany.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            nameOfCompany.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            titleDescription.topAnchor.constraint(equalTo: nameOfCompany.bottomAnchor, constant: 30),
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
        nameOfCompany.textColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
        nameOfCompany.textAlignment = .center
        nameOfCompany.numberOfLines = 0
        view.addSubview(nameOfCompany)
    }
    
    private func titleDescriptionSetup(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.font = .boldSystemFont(ofSize: 25)
        titleDescription.textColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
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
    
    private func setCompanyDescription(){
        guard let company = company else {return}
        nameOfCompany.text.self = company.name
        companyDescription.text.self = company.description
    }
}
