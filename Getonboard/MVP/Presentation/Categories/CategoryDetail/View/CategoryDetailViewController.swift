import UIKit

class CategoryDetailViewController: UIViewController, CategoryDetailProtocol{
    
    private let workOffersTableView = UITableView()
    var categoryID: String = ""
    var workOffers : CategoryDetailModel?
    let presenter = CategoryDetailPresenter()
    
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
        workOffersTableView.dataSource = self
        workOffersTableView.delegate = self
        workOffersTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: "CategoryDetailTableViewCell" )
        view.addSubview(workOffersTableView)
    }
    
    func presentCategoryDetail(categoryDetail: CategoryDetailModel) {
        self.workOffers = categoryDetail
        DispatchQueue.main.async {
            self.workOffersTableView.reloadData()
        }
    }
}

extension CategoryDetailViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workOffers?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as? CategoryDetailTableViewCell, let model = workOffers?.data[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellValue(model: model)
        return cell
    }
}

extension CategoryDetailViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
    }
}
