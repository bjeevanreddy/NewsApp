//
//  ArticleModel.swift
//  NewsApp
//
//  Created by student on 11/23/21.
//

import Foundation
import IsoCountryCodes
class Articles{
    struct ArticleModel:Codable{
        var totalResults:Int
        var articles:[Article]
    }
    
    var articlesArray:[Article]=[]
    var trendingArray:[Article]=[]
    var countryNewsArray:[Article]=[]
    func getHeadLinesOne(completion: @escaping ()->()){
        print("The url of the news is \(HeadLineAPI1)")
        guard let url = URL(string: HeadLineAPI1) else{
            return
        }
        let session =  URLSession.shared
        
        let task = session.dataTask(with: url) { data, reponse, error in
            if let error = error {
                print("Error is :\(error.localizedDescription)")
            }
            do {
                let returnedData1 = try JSONDecoder().decode(ArticleModel.self, from: data!)
                print(returnedData1)
                self.articlesArray =  returnedData1.articles
            }catch{
                print("Cannot get data")
                print("Error")
            }
            completion()
        }
        task.resume()
    }
    func getHeadLinesTwo(completion: @escaping ()->()){
        print("The url of the news2 is \(HeadLineAPI2)")
        guard let url = URL(string: HeadLineAPI2) else{
            return
        }
        let session =  URLSession.shared
        
        let task = session.dataTask(with: url) { data, reponse, error in
            if let error = error {
                print("Error is :\(error.localizedDescription)")
            }
            do {
                let returnedData2 = try JSONDecoder().decode(ArticleModel.self, from: data!)
                self.articlesArray = self.articlesArray + returnedData2.articles
            }catch{
                print("Cannot get data")
                print("Error")
            }
            completion()
        }
        task.resume()
    }
    
    func getTrendingTopics(trend:String,completion: @escaping ()->()){
        let newUrl = String("\(TrendingAPI)\(trend)").trimmingCharacters(in: .whitespaces)
        print("The url of the trending is \(newUrl)")

        guard let url = URL(string: newUrl) else{
            return
        }
        let session1 =  URLSession.shared
        
        let task1 = session1.dataTask(with: url) { data, reponse, error in
            if let error = error {
                print("Error is :\(error.localizedDescription)")
            }
            do {
                let returnedDataTrends = try JSONDecoder().decode(ArticleModel.self, from: data!)
                self.trendingArray =  returnedDataTrends.articles
            }catch{
                print("Cannot get data")
                print(error)
            }
            completion()
        }
        task1.resume()
    }
    
    func getCountryNews(country:String,completion: @escaping ()->()){
        let cn = IsoCountryCodes.searchByName(country)
        let newUrl = String("\(countryAPI)\(cn!.alpha2)").trimmingCharacters(in: .whitespaces)
        print("The url of the country is \(newUrl)")
       
        guard let url = URL(string: newUrl) else{
            return
        }
        let session1 =  URLSession.shared
        
        let task1 = session1.dataTask(with: url) { data, reponse, error in
            if let error = error {
                print("Error is :\(error.localizedDescription)")
            }
            do {
                let returnedDataTrends = try JSONDecoder().decode(ArticleModel.self, from: data!)
                self.countryNewsArray =  returnedDataTrends.articles
            }catch{
                print("Cannot get data")
                print(error)
            }
            completion()
        }
        task1.resume()
    }
    
}

