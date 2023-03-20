import UIKit

class CategoryDetailViewController: UIViewController, CategoryDetailProtocol{
    
    private let workOffersTableView = UITableView()
    var categoryID: String = ""
    private let dataSource : CategoryDetailDataSource?
    private let delegate : CategoryDetailDelegate?
    var workOffers : CategoryDetailModel?
    let presenter = CategoryDetailPresenter()
    
    init(dataSourceTable: CategoryDetailDataSource, delegateTable: CategoryDetailDelegate){
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
            workOffersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workOffersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workOffersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workOffersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func initTableView() {
        workOffersTableView.translatesAutoresizingMaskIntoConstraints = false
        workOffersTableView.dataSource = dataSource
        workOffersTableView.delegate = delegate
        workOffersTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: "CategoryDetailTableViewCell" )
        view.addSubview(workOffersTableView)
    }
    
    func presentCategoryDetail(categoryDetail: CategoryDetailModel) {
        self.workOffers = categoryDetail
        DispatchQueue.main.async {
            self.workOffersTableView.reloadData()
        }
    }
    
    func goToDetail(indexPath: IndexPath){
        guard let model = workOffers?.data[indexPath.row].attributes  else {return}
        let categoryDetail = JobRequirementsViewController()
        categoryDetail.jobRequirements = model
        present(categoryDetail, animated: true)
    }
}

