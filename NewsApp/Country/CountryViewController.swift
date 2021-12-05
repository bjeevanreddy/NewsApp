//
//  CountryViewController.swift
//  NewsApp
//
//  Created by student on 11/26/21.
//

import UIKit

class CountryViewController: UIViewController {
    
    @IBOutlet weak var countrytableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var countryLbl:UILabel!
    var activityIndicator=UIActivityIndicatorView()
    var artcilesObj=Articles()
    override func viewDidLoad() {
        super.viewDidLoad()
        countrytableView.delegate = self
        countrytableView.dataSource = self
        searchBar.delegate = self
        let TableCellnib = UINib(nibName: "CountryNewsCell", bundle: nil)
        countrytableView.register(TableCellnib, forCellReuseIdentifier: "CountryNewsCell")
        startActivityIndicator()
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        artcilesObj.getCountryNews(country:"United States"){
            DispatchQueue.main.async {
                self.countryLbl.text = "Headlines Today In United States"
                self.countrytableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.view.isUserInteractionEnabled = true
            }
        }
        
    }
    
    func startActivityIndicator(){
        
        activityIndicator.color = .gray
        activityIndicator.center = self.view.center
        activityIndicator.style = .medium
        activityIndicator.isUserInteractionEnabled=false
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    
}

extension CountryViewController:UITableViewDelegate{
    
}
extension CountryViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artcilesObj.countryNewsArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryNewsCell", for: indexPath) as! CountryNewsCell
        var myArticleInfo = artcilesObj.countryNewsArray[indexPath.row]
        cell.titleLbl.text = myArticleInfo.title
        if myArticleInfo.urlToImage == ""{
            myArticleInfo.urlToImage = "https://dummyimage.com/300"
        }
        let url = URL(string: myArticleInfo.urlToImage ?? "https://dummyimage.com/300")
        do {
            let data = try Data(contentsOf: url!)
            cell.newsImg.image = UIImage(data: data)
            
        } catch {
            print("😡 ERROR: error thrown tryign to get imag from url \(url!)")
        }
        cell.contentLbl.text = myArticleInfo.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300;
    }
    
    
}

extension CountryViewController:UISearchBarDelegate{
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
       
        if searchBar.text == ""{
            let alert = UIAlertController(title: "Alert", message: "Search field cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in self.searchBar.becomeFirstResponder()}))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            startActivityIndicator()
            activityIndicator.startAnimating()
            view.isUserInteractionEnabled = false
            
            artcilesObj.getCountryNews(country: searchBar.text!){
                
                DispatchQueue.main.async {
                    self.countryLbl.text = "\(String(describing: searchBar.text!)) News"
                    self.countrytableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    self.view.isUserInteractionEnabled = true
                }
            }
        }
    }
}
