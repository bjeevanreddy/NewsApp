//
//  TrendingViewController.swift
//  NewsApp
//
//  Created by student on 11/11/21.
//

import UIKit
import SafariServices
class TrendingViewController: UIViewController {
    
    @IBOutlet weak var topicsCollections: UICollectionView!
    
    @IBOutlet weak var trendingTable: UITableView!
    var activityIndicator=UIActivityIndicatorView()
    var artcilesObj=Articles()
    var trends = ["Apple","Tesla","Google","Science","Technology","Entertainment","Bitcoin","stocks"]
    override func viewDidLoad() {
        super.viewDidLoad()
        topicsCollections.dataSource = self
        topicsCollections.delegate = self
        trendingTable.dataSource = self
        trendingTable.delegate = self
        let Colectionnib = UINib(nibName: "TrendingTopicCollectionViewCell", bundle: nil)
        topicsCollections.register(Colectionnib, forCellWithReuseIdentifier: "TrendingTopicCell")
        let TableCellnib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
        trendingTable.register(TableCellnib, forCellReuseIdentifier: "HeadlineTableViewCell")
        
        startActivityIndicator()
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        artcilesObj.getTrendingTopics(trend:trends[0]){
            DispatchQueue.main.async {
                self.navigationItem.title = "Today's \(self.trends[0]) Trending"
                self.trendingTable.reloadData()
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
    var lastIndexActive:IndexPath = [1 ,0]
    
    
}

extension TrendingViewController:UICollectionViewDelegate{
    
    
}
extension TrendingViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingTopicCell", for: indexPath) as! TrendingTopicCollectionViewCell
        cell.topicLabel.text = trends[indexPath.row]
        if indexPath.row == 0 {
            cell.topicLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.cellView.backgroundColor = #colorLiteral(red: 0.8743465543, green: 0.1577501893, blue: 0.2328583598, alpha: 1)
            cell.cellView.layer.masksToBounds = true
            let cell1 = collectionView.cellForItem(at: self.lastIndexActive) as? TrendingTopicCollectionViewCell
            cell1?.topicLabel.textColor = .systemBlue
            cell1?.cellView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            cell1?.cellView.layer.masksToBounds = true
            self.lastIndexActive = indexPath
        }
        cell.layer.cornerRadius = 15
        
        return cell;
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(trends[indexPath.row])
        if self.lastIndexActive != indexPath {
            
            // change here
            let cell = collectionView.cellForItem(at: indexPath) as! TrendingTopicCollectionViewCell
            cell.topicLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.cellView.backgroundColor = #colorLiteral(red: 0.8743465543, green: 0.1577501893, blue: 0.2328583598, alpha: 1)
            cell.cellView.layer.masksToBounds = true
            
            let cell1 = collectionView.cellForItem(at: self.lastIndexActive) as? TrendingTopicCollectionViewCell
            cell1?.topicLabel.textColor = .systemBlue
            cell1?.cellView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
            cell1?.cellView.layer.masksToBounds = true
            self.lastIndexActive = indexPath
            
            // Run for show
            // Thanks
        }
        startActivityIndicator()
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        artcilesObj.getTrendingTopics(trend:trends[indexPath.row]){
            DispatchQueue.main.async {
                self.navigationItem.title = "Today's \(self.trends[indexPath.row]) Trend"
                self.trendingTable.reloadData()
                self.activityIndicator.stopAnimating()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
}

extension TrendingViewController: UITableViewDelegate{}
extension TrendingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artcilesObj.trendingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineTableViewCell", for: indexPath) as! HeadlineTableViewCell
        
        var myArticleInfo = artcilesObj.trendingArray[indexPath.row]
        cell.headingLabel.text = myArticleInfo.title
        if myArticleInfo.urlToImage == nil{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SFSafariViewController(url: URL(string: artcilesObj.trendingArray[indexPath.row].url)!)
        self.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    
}


