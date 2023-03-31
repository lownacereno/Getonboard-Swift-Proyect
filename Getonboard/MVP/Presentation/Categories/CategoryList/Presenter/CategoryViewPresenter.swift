import UIKit

class CategoryViewPresenter{
    
    private var delegate : CategoryPresenterProtocol?
    private let categoryListUseCase : CategoryListUseCase?
    
    init(categoryList : CategoryListUseCase) {
        self.categoryListUseCase = categoryList
    }
    
    public func getCategories(){
        do {try self.categoryListUseCase?.getCategories( completionHandler: { [weak self] result in
            switch result{
            case let .success(model):
                self?.delegate?.presentCategories(categories: model)
            case .failure:
                self?.delegate?.showError()
            }
        })
        }
        catch{
            print(error)
        }
    }
    
    public func setViewDelegate(delegate: CategoryPresenterProtocol){
        self.delegate = delegate
    }
}

