import UIKit

class CompanyViewController: UIViewController, CompanyPresenterDelegateProtocol{
    
    var company : CompanyModel?
    
    private let companyTableView = UITableView()
    private let dataSource : CompanyTableViewDataSource?
    private let delegate : CompanyTableViewDelegate?
    private let presenter = CompanyViewPresenter()
    
    init(dataSourceTable: CompanyTableViewDataSource, delegateTable: CompanyTableViewDelegate){
            self.dataSource = dataSourceTable
            self.delegate = delegateTable
            super.init(nibName: nil, bundle: nil)
            self.dataSource?.viewController = self
            self.delegate?.viewController = self
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "Compañías Asociadas"
        view.backgroundColor = .white
        presenter.setViewDelegate(delegate: self)
        presenter.getCompanies()
        initViews()
    }
    
    private func initViews(){
        companyTableViewSetup()
        tableViewConstraints()
    }
    
    private func companyTableViewSetup(){
        companyTableView.translatesAutoresizingMaskIntoConstraints = false
        companyTableView.backgroundColor = .white
        companyTableView.dataSource = dataSource
        companyTableView.delegate = delegate
        companyTableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "CompanyTableViewCell")
        view.addSubview(companyTableView)
    }
    
    private func tableViewConstraints(){
            NSLayoutConstraint.activate([
            companyTableView.topAnchor.constraint(equalTo: view.topAnchor),
            companyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            companyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            companyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func presentCompanies(companies: CompanyModel) {
        self.company = companies
        DispatchQueue.main.async {
            self.companyTableView.reloadData()
        }
    }
}

