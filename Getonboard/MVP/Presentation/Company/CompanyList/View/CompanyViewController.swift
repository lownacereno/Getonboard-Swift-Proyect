import UIKit

class CompanyViewController: UIViewController{
    
    var company : CompanyModel?
    let companyTableView = UITableView()
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)]
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
}

extension CompanyViewController: CompanyPresenterProtocol{
    
    func goToDetail(indexPath: IndexPath) {
        let model = company?.data[indexPath.row].attributes
        let companyDetail = CompanyDetailViewController()
        companyDetail.company = model
        present(companyDetail, animated: true)
    }
    
    func presentCompanies(companies: CompanyModel) {
        self.company = companies
        DispatchQueue.main.async {
            self.companyTableView.reloadData()
        }
    }
}
