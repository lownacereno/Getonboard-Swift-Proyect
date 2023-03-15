//import UIKit
//
//final class CompanyDataService{
//    
//    func getDataFromApi(){
//        let urlSession = URLSession.shared
//        let url = URL(string: "https://www.getonbrd.com/api/v0/companies?per_page=10&page=1")
//        
//        guard let url = url else{return}
//        
//        urlSession.dataTask(with: url) { data, response, error in
//            print("Data \(String(describing: data))")
//            if data == data {
//                let json = try? JSONSerialization.jsonObject(with: data)
//            }
//            print("Response \(String(describing: response))")
//            print("Error \(String(describing: error))")
//        }.resume()
//    }
//}
