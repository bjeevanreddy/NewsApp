//
//  HeadlineViewController.swift
//  NewsApp
//
//  Created by student on 11/10/21.
//

import UIKit
import SafariServices

class HeadlineViewController: UIViewController,UITextViewDelegate{

    @IBOutlet weak var publishedLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var browserLbl: UITextView!
    
    var article:Article!
    override func viewDidLoad() {
        super.viewDidLoad()

        publishedLbl.text = "\(article.source.name) -------> \(article.publishedAt)"
        titleLbl.text = article.title
        descriptionLabel.text = article.description
        let url = URL(string: article.urlToImage ?? "https://dummyimage.com/300")
        do {
            let data = try Data(contentsOf: url!)
            newsImage.image = UIImage(data: data)
            
        } catch {
            print("😡 ERROR: error thrown tryign to get imag from url \(url!)")
        }
        contentTextView.text = ( article.content ?? "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
        let attributedString = NSMutableAttributedString(string: "View In Browser")
        attributedString.addAttribute(.link, value: article.url, range: NSRange(location: 0, length: 15))
        browserLbl.attributedText = attributedString
        browserLbl.delegate = self
        
//        browserLbl.text = "View in browser \n \(article.url)"
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(URL)
        let vc = SFSafariViewController(url: URL)
        self.present(vc, animated: true, completion: nil)
//        UIApplication.shared.openURL(URL)
        return false
    }
    
    

}
