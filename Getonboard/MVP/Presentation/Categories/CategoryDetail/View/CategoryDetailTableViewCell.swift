import UIKit
import Kingfisher

class CategoryDetailTableViewCell: UITableViewCell{
    private let jobTitle = UILabel()
    private let publicationDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        jobTitleCell()
        publicationDateCell()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            jobTitle.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            jobTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            jobTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            publicationDate.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 12),
            publicationDate.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
            publicationDate.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12),
            publicationDate.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -12)
        ])
    }
    
    private func jobTitleCell(){
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.font = .boldSystemFont(ofSize: 20)
        jobTitle.textColor = .black
        jobTitle.numberOfLines = 0
        addSubview(jobTitle)
    }
    
    private func publicationDateCell(){
        publicationDate.translatesAutoresizingMaskIntoConstraints = false
        publicationDate.font = .boldSystemFont(ofSize: 16)
        publicationDate.textColor = .black
        publicationDate.numberOfLines = 0
        addSubview(publicationDate)
    }
    
    func setCellValue(model: DatumAttributes){
        self.jobTitle.text = model.title
        let dateTime = Date(timeIntervalSince1970: TimeInterval(model.publishedAt))
        setDate(date: dateTime)
        
    }
    
    private func setDate(date : Date){
        let currentDay = Date.now
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US_POSIX")
        format.dateFormat = "dd-MMM-yyyy"
        let date = format.string(from: date)
        let actualDate = format.string(from: currentDay)
        if actualDate == date{
            self.publicationDate.text = "Nuevo"
            self.publicationDate.textColor = .red
            self.publicationDate.font =  UIFont(name: "HelveticaNeue-Bold", size: 18)
        }else{
            self.publicationDate.text = date
            self.publicationDate.textColor = .black
            self.publicationDate.font =  UIFont(name: "HelveticaNeue", size: 16)
        }
    }
}

