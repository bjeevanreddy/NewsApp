//
//  ViewController.swift
//  NewsApp
//
//  Created by student on 11/10/21.
//

import UIKit

class HeadLinesViewController: UIViewController {

    @IBOutlet weak var headlinesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        headlinesTableView.dataSource = self
        headlinesTableView.delegate = self
        let nib = UINib(nibName: "HeadlineTableViewCell", bundle: nil)
        headlinesTableView.register(nib, forCellReuseIdentifier: "HeadlineCell")
        
    }


}

extension HeadLinesViewController:UITableViewDelegate{
    
}

extension HeadLinesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
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

