//
//  HeadLineModel.swift
//  NewsApp
//
//  Created by student on 11/23/21.
//

import Foundation


struct Article:Codable {
    var source:SourceModel!
    var title:String?
    var description:String?
    var url:String = ""
    var urlToImage:String?
    var publishedAt:String = ""
    var content:String = ""
}



//"source": {
//"id": "bbc-news",
//"name": "BBC News"
//},
//"author": null,
//"title": "Anthony Watson: Bath & England wing given suspended ban after criticising referee on Twitter",
//"description": "Bath and England wing Anthony Watson is handed a suspended one-week ban after criticising refereeing decisions on Twitter.",
//"url": "https://www.bbc.co.uk/sport/rugby-union/59393368",
//"urlToImage": "https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/1212B/production/_121772047_anthony_watson_gettyimages-1235953870.jpg",
//"publishedAt": "2021-11-23T17:27:32Z",
//"content": "Anthony Watson has been out of action with a serious knee injury sustained for Bath against Saracens on 17 October\r\nBath and England winger Anthony Watson has been handed a one-week suspended ban aft… [+1594 chars]"
