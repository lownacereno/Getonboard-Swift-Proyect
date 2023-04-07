import UIKit

class JobRequirementsViewController: UIViewController{
    
    var jobRequirements : DatumAttributes?
    private let jobDescription = UILabel()
    private let jobTitle = UILabel()
    private let titleDescription = UILabel()
    private let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    private func initDetailViews(){
        jobDescriptionSetup()
        titleDescriptionSetup()
        jobTitleSetup()
        submitButtonSetup()
        jobRequirementsConstraints()
        setJobSetup()
    }
    
    private func jobRequirementsConstraints(){
        NSLayoutConstraint.activate([
            jobTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            jobTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            jobTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            titleDescription.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 16),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            jobDescription.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 30),
            jobDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.topAnchor.constraint(equalTo: jobDescription.bottomAnchor, constant: 30),
            submitButton.widthAnchor.constraint(equalToConstant: 150),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func jobDescriptionSetup(){
        jobDescription.translatesAutoresizingMaskIntoConstraints = false
        jobDescription.font = .boldSystemFont(ofSize: 18)
        jobDescription.textColor = .black
        jobDescription.textAlignment = .left
        jobDescription.numberOfLines = 0
        view.addSubview(jobDescription)
    }
    
    private func titleDescriptionSetup(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.font = .systemFont(ofSize: 18)
        titleDescription.textColor = .black
        titleDescription.numberOfLines = 0
        titleDescription.text = "Requerimientos del cargo"
        view.addSubview(titleDescription)
    }
    
    private func jobTitleSetup(){
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = .boldSystemFont(ofSize: 20)
        jobTitle.numberOfLines = 0
        jobTitle.textColor = AppColors.blueCustomColor
        jobTitle.textAlignment = .center
        view.addSubview(jobTitle)
    }
    
    private func submitButtonSetup(){
        
        submitButton.backgroundColor = AppColors.blueCustomColor
        submitButton.setTitle("Postular", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
        submitButton.layer.cornerRadius = 15
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
    }
    
    @objc func submitButtonAction(){
        let alert = UIAlertController(title: "Postulación exitosa", message: "Se le ha enviado un correo para completar su postulación", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    private func setJobSetup(){
        guard let jobModel = jobRequirements else {return}
        jobTitle.text.self = jobModel.title
        jobDescription.text.self = jobModel.description.htmlToString
        
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
