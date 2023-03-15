import UIKit

class SplashScreen: UIViewController{
    
    private let icon = UIImageView()
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        view.backgroundColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
    }
    
    private func initViews(){
        iconLogoCell()
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
    
    private func iconLogoCell(){
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
