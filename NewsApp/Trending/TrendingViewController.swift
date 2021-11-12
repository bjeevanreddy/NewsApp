//
//  TrendingViewController.swift
//  NewsApp
//
//  Created by student on 11/11/21.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var topicsCollections: UICollectionView!
    
    @IBOutlet weak var trendingTable: UITableView!
    var trends = ["Tesla","Apple","Google","Sceince","Technology","Entertainment"]
    override func viewDidLoad() {
        super.viewDidLoad()
        topicsCollections.dataSource = self
        topicsCollections.delegate = self
        trendingTable.dataSource = self
        trendingTable.delegate = self
        let Colectionnib = UINib(nibName: "TrendingTopicCollectionViewCell", bundle: nil)
        topicsCollections.register(Colectionnib, forCellWithReuseIdentifier: "TrendingTopicCell")
        let TableCellnib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
        trendingTable.register(TableCellnib, forCellReuseIdentifier: "HeadlineCell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        return cell;
    }

    
}

extension TrendingViewController: UITableViewDelegate{}
extension TrendingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadlineCell", for: indexPath) as! HeadlineTableViewCell
        
        cell.headingLabel.text = "Tesla news is more fun"
        cell.contentLabel.text = "DETROIT -- After making a promise on Twitter, Tesla CEO Elon Musk has sold about 900,000 shares of the electric car maker's stock, netting over $1.1 billion that will go toward paying tax obligations"
        
        cell.headlineImage.image = UIImage(named: "tesla")
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    
}
