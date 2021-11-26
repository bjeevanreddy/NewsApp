//
//  ViewController.swift
//  NewsApp
//
//  Created by student on 11/10/21.
//

import UIKit

class HeadLinesViewController: UIViewController {
    
    @IBOutlet weak var headlinesTableView: UITableView!
    var activityIndicator=UIActivityIndicatorView()
    var artcilesObj=Articles()
    override func viewDidLoad() {
        super.viewDidLoad()
        headlinesTableView.dataSource = self
        headlinesTableView.delegate = self
        let nib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
        headlinesTableView.register(nib, forCellReuseIdentifier: "HeadlineTableViewCell")
        startActivityIndicator()
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        artcilesObj.getHeadLinesOne(){
            DispatchQueue.main.async {
                self.navigationItem.title = "Today's HeadLines"
                self.headlinesTableView.reloadData()
                self.activityIndicator.stopAnimating()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
    func startActivityIndicator(){
        
        activityIndicator.color = .blue
        activityIndicator.center = self.view.center
        activityIndicator.style = .large
        activityIndicator.isUserInteractionEnabled=false
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHeadLine"{
            let destination = segue.destination as! HeadlineViewController
            
            let selectedIndexpath = headlinesTableView.indexPathForSelectedRow!
            destination.article = artcilesObj.articlesArray[selectedIndexpath.row]
            
            headlinesTableView.deselectRow(at: selectedIndexpath, animated: true)
            
        }
    }
    
}

extension HeadLinesViewController:UITableViewDelegate{
    
}

extension HeadLinesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artcilesObj.articlesArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineTableViewCell", for: indexPath) as! HeadlineTableViewCell
        
        
        if indexPath.row == artcilesObj.articlesArray.count-1 {
            activityIndicator.startAnimating()
            view.isUserInteractionEnabled = false
            artcilesObj.getHeadLinesTwo() {
                
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.headlinesTableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    self.view.isUserInteractionEnabled = true
                }
            }
            
            
        }
        
        var myArticleInfo = artcilesObj.articlesArray[indexPath.row]
        cell.headingLabel.text = myArticleInfo.title
        if myArticleInfo.urlToImage == ""{
            myArticleInfo.urlToImage = "https://dummyimage.com/300"
        }
        let url = URL(string: myArticleInfo.urlToImage ?? "https://dummyimage.com/300")
        do {
            let data = try Data(contentsOf: url!)
            cell.headlineImage.image = UIImage(data: data)
            
        } catch {
            print("😡 ERROR: error thrown tryign to get imag from url \(url!)")
        }
        cell.contentLabel.text = myArticleInfo.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("happy tap")
//        tableView.deselectRow(at: indexPath, animated: true)
        // pass any object as parameter, i.e. the tapped row
        performSegue(withIdentifier: "showHeadLine", sender: indexPath.row)
    }
    
    
}

