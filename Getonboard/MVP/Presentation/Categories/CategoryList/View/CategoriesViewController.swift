import UIKit

class CategoryViewController: UIViewController{
    
    var categories : [DataCategory]?
    let categoryTableView = UITableView()
    private let dataSource : CategoryTableViewDataSource?
    private let delegate : CategoryTableViewDelegate?
    private let presenter = CategoryViewPresenter(categoryList: CategoryListUseCase())
    private let categoryTitle = UILabel()
    
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
        let logo = UIImage(named: "icon")
        let image = UIImageView(image: logo)
        image.contentMode = .scaleAspectFit
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppColors.blueCustomColor]
        view.backgroundColor = .white
        presenter.setViewDelegate(delegate: self)
        presenter.getCategories()
        initViews()
    }
    
    private func initViews(){
        categoryTableViewSetup()
        categoryTitleSetup()
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
    
    private func categoryTitleSetup(){
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        categoryTitle.font = .boldSystemFont(ofSize: 20)
        categoryTitle.textColor = AppColors.blueCustomColor
        categoryTitle.numberOfLines = 0
        categoryTitle.text = "Categorías de empleo"
        view.addSubview(categoryTitle)
    }
    
    private func tableViewConstraints(){
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            categoryTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryTableView.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 12),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CategoryViewController: CategoryPresenterProtocol{
    
    func presentCategories(categories: [DataCategory]) {
        self.categories = categories.sorted{
            $0.attributes.name.compare($1.attributes.name) == .orderedAscending
        }
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
    
    func goToDetail(indexPath: IndexPath){
        guard let model = categories?[indexPath.row].id else {return}
        let categoryDetail = CategoryDetailViewController(dataSourceTable: CategoryDetailTableViewDataSource(), delegateTable: CategoryDetailTableViewDelegate())
        categoryDetail.categoryID = model
        navigationController?.pushViewController(categoryDetail, animated: true)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Parece que hay un error, inténtelo de nuevo", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
