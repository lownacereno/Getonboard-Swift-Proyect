import UIKit

class CategoryDetailPresenter{
    
    weak var delegate : CategoryDetailPresenterProtocol?
    private let categoryDetailUseCase : CategoryDetailUseCase?
    
    init(categoryDetail : CategoryDetailUseCase) {
        self.categoryDetailUseCase = categoryDetail
    }
    
    public func getCategoryDetail(id: String){
        do {try self.categoryDetailUseCase?.getCategoryDetail(id: id, completionHandler: { [weak self] result in
            switch result{
            case let .success(model):
                self?.delegate?.presentCategoryDetail(categoryDetail: model)
            case .failure:
                self?.delegate?.showError()
            }
        })
        }
        catch{
            print(error)
        }
    }
    
    public func setViewDelegate(delegate: CategoryDetailPresenterProtocol){
        self.delegate = delegate
    }
}
