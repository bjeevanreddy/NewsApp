//
//  HeadlineTableViewCell.swift
//  NewsApp
//
//  Created by student on 11/10/21.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var headlineImage: UIImageView!
    
//    var myArticleInfo:Articles.Article!
    
//    required init?(coder aDecoder: NSCoder) {
//        self.headingLabel.text = ""
//        self.contentLabel.text = ""
//        self.headlineImage.image = UIImage(named: "elon")
//        super.init(coder: aDecoder)
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            // code common to all your cells goes here
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//        }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        headingLabel.text = myArticleInfo.title
//        guard let url = URL(string: myArticleInfo.urlToImage) else {return}
//        do {
//            let data = try Data(contentsOf: url)
//            self.headlineImage.image = UIImage(data: data)
//
//        } catch {
//            print("😡 ERROR: error thrown tryign to get imag from url \(url)")
//        }
//        contentLabel.text = myArticleInfo.description
    }
    
}
