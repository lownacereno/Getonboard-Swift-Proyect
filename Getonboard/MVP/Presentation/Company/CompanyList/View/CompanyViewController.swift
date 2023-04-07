import UIKit

class CompanyViewController: UIViewController{
    
    var company : [DataModel]? = []
    var filteredCompany : [DataModel]? = []
    let companyTableView = UITableView()
    private let dataSource : CompanyTableViewDataSource?
    private let delegate : CompanyTableViewDelegate?
    private let presenter = CompanyViewPresenter(companyList: CompanyUseCase())
    private var searchBarView = UISearchBar()
    private let companyTitle = UILabel()
    
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
        view.backgroundColor = .white
        let logo = UIImage(named: "icon")
        let image = UIImageView(image: logo)
        image.contentMode = .scaleAspectFit
        self.navigationItem.titleView = image
        searchBarView.delegate = self
        presenter.setViewDelegate(delegate: self)
        presenter.getCompanies()
        initViews()
    }
    
    private func initViews(){
        navigationControllerSetup()
        searchBarSetup()
        companyTableViewSetup()
        searchBar(searchBarView, textDidChange: "")
        companyTitleSetup()
        tableViewConstraints()
    }
    
    private func navigationControllerSetup(){
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "Compañías Asociadas"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppColors.blueCustomColor]
    }
    
    private func searchBarSetup(){
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.backgroundColor = .white
        view.addSubview(searchBarView)
    }
    
    private func companyTitleSetup(){
        companyTitle.translatesAutoresizingMaskIntoConstraints = false
        companyTitle.font = .boldSystemFont(ofSize: 20)
        companyTitle.textColor = AppColors.blueCustomColor
        companyTitle.numberOfLines = 0
        companyTitle.text = "Compañías Asociadas"
        view.addSubview(companyTitle)
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
            companyTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            companyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBarView.topAnchor.constraint(equalTo: companyTitle.bottomAnchor, constant: 12),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBarView.heightAnchor.constraint(equalToConstant: 50),
            companyTableView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor),
            companyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            companyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            companyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CompanyViewController: CompanyPresenterProtocol{
    
    func goToDetail(indexPath: IndexPath) {
        let model = company?[indexPath.row].attributes
        let companyDetail = CompanyDetailViewController()
        companyDetail.company = model
        present(companyDetail, animated: true)
    }
    
    func presentCompanies(companies:  [DataModel]) {
        self.filteredCompany = companies.sorted{
            $0.attributes.name.compare($1.attributes.name) == .orderedAscending
        }
        self.company = filteredCompany
        DispatchQueue.main.async {
            self.companyTableView.reloadData()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Parece que hay un error, inténtelo de nuevo", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

