import UIKit

class SplashScreen: UIViewController{
    
    private let icon = UIImageView()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        view.backgroundColor = .white
    }
    
    private func initViews(){
        iconCell()
        splashScreenConstraints()
        splashTimer()
    }
    
    private func splashScreenConstraints(){
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 200),
            icon.heightAnchor.constraint(equalToConstant: 50)
        ]) }
    
    private func iconCell(){
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "icon")
        view.addSubview(icon)
    }
    
    private func splashTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {timer in
            let viewController = TabBarController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
