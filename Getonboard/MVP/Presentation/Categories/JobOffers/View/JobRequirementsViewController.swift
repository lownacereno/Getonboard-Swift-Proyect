import UIKit

class JobRequirementsViewController: UIViewController{
    
    var jobRequirements : DatumAttributes?
    private let jobDescription = UILabel()
    private let jobTitle = UILabel()
    private let titleDescription = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initDetailViews()
    }
    
    private func initDetailViews(){
        jobDescriptionSetup()
        titleDescriptionSetup()
        jobTitleSetup()
        jobRequirementsConstraints()
        setJobSetup()
    }
    
    private func jobRequirementsConstraints(){
        NSLayoutConstraint.activate([
            titleDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            jobTitle.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 16),
            jobTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            jobTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -12),
            jobDescription.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 30),
            jobDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func jobDescriptionSetup(){
        jobDescription.translatesAutoresizingMaskIntoConstraints = false
        jobDescription.font = .boldSystemFont(ofSize: 18)
        jobDescription.textColor = .black
        jobDescription.textAlignment = .center
        jobDescription.numberOfLines = 0
        view.addSubview(jobDescription)
    }
    
    private func titleDescriptionSetup(){
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.font = .boldSystemFont(ofSize: 20)
        titleDescription.textColor = .init(red: 14/255.0, green: 131/255.0, blue: 136/255.0, alpha: 1)
        titleDescription.numberOfLines = 0
        titleDescription.text = "Requerimientos del cargo"
        view.addSubview(titleDescription)
    }
    
    private func jobTitleSetup(){
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = .systemFont(ofSize: 18)
        jobTitle.numberOfLines = 0
        jobTitle.textAlignment = .justified
        view.addSubview(jobTitle)
    }
    
    private func setJobSetup(){
        guard let jobModel = jobRequirements else {return}
        jobTitle.text.self = jobModel.title
        jobDescription.text.self = jobModel.description.replacingOccurrences(of: "<ul><li>", with: "")
        
    }
}
