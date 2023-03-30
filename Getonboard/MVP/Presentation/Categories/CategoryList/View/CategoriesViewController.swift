import UIKit

class CategoryViewController: UIViewController{
    
    var categories : CategoryModel?
    let categoryTableView = UITableView()
    private let dataSource : CategoryTableViewDataSource?
    private let delegate : CategoryTableViewDelegate?
    private let presenter = CategoryViewPresenter()
    
    init(dataSourceTable: CategoryTableViewDataSource, delegateTable: CategoryTableViewDelegate){
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
        self.navigationItem.title = "Categorías de trabajo"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)]
        view.backgroundColor = .white
        presenter.setViewDelegate(delegate: self)
        presenter.getCategories()
        initViews()
    }
    
    private func initViews(){
        categoryTableViewSetup()
        tableViewConstraints()
    }
    
    private func categoryTableViewSetup(){
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        categoryTableView.backgroundColor = .white
        categoryTableView.dataSource = dataSource
        categoryTableView.delegate = delegate
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        view.addSubview(categoryTableView)
    }
    
    private func tableViewConstraints(){
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoryViewController: CategoryPresenterProtocol{
    
    func presentCategories(categories: CategoryModel) {
        self.categories = categories
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
    
    func goToDetail(indexPath: IndexPath){
        guard let model = categories?.data[indexPath.row].id else {return}
        let categoryDetail = CategoryDetailViewController(dataSourceTable: CategoryDetailTableViewDataSource(), delegateTable: CategoryDetailTableViewDelegate())
        categoryDetail.categoryID = model
        navigationController?.pushViewController(categoryDetail, animated: true)
    }
}








