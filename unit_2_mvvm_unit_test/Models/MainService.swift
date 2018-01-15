//
//  MainService.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import Foundation
import ObjectMapper

class MainService: MainServiceInterface {
    func getBitCoinNews(completion: @escaping (ArticleResponse?) -> Void, failure: @escaping (Error) -> Void) {
        let url = "https://newsapi.org/v2/everything?q=bitcoin&sortBy=publishedAt&apiKey=698d881487784f158230814684ffcfa6"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            DispatchQueue.main.async(execute: {
                // work Needs to be done
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as? [String : Any]
                    //print(json)
                    completion(Mapper<ArticleResponse>().map(JSON: json ?? [String : Any]()))
                } catch {
                    print("error")
                    failure(error)
                }
            })
        })
        task.resume()
    }
}
