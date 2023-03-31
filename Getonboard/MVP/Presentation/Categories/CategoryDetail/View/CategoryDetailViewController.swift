import UIKit

class CategoryDetailViewController: UIViewController{
    
    let jobListTableView = UITableView()
    var categoryID: String = ""
    private let dataSource : CategoryDetailTableViewDataSource?
    private let delegate : CategoryDetailTableViewDelegate?
    var workOffers : [CategoryDetailData]?
    let presenter = CategoryDetailPresenter(categoryDetail: CategoryDetailUseCase())
    
    init(dataSourceTable: CategoryDetailTableViewDataSource, delegateTable: CategoryDetailTableViewDelegate){
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
        title = "Ofertas de trabajo"
        presenter.getCategoryDetail(id: categoryID)
        presenter.setViewDelegate(delegate: self)
        initScreen()
    }
    
    private func initScreen(){
        initTableView()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            jobListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            jobListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            jobListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            jobListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func initTableView() {
        jobListTableView.translatesAutoresizingMaskIntoConstraints = false
        jobListTableView.dataSource = dataSource
        jobListTableView.delegate = delegate
        jobListTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: "CategoryDetailTableViewCell" )
        view.addSubview(jobListTableView)
    }
}

extension CategoryDetailViewController: CategoryDetailPresenterProtocol{
    
    func presentCategoryDetail(categoryDetail: [CategoryDetailData]) {
        self.workOffers = categoryDetail
        DispatchQueue.main.async {
            self.jobListTableView.reloadData()
        }
    }
    
    func goToDetail(indexPath: IndexPath){
        guard let model = workOffers?[indexPath.row].attributes  else {return}
        let categoryDetail = JobRequirementsViewController()
        categoryDetail.jobRequirements = model
        present(categoryDetail, animated: true)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Parece que hay un error, inténtelo de nuevo", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


