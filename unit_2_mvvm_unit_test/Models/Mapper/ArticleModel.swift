//
//  ArticleModel.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleModel: NSObject, Mappable {
    var author: String?
    var title: String?
    var des: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var source: SourceModel?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        des <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        source <- map["source"]
    }
    
    override var description:String {
        return Mapper().toJSONString(self, prettyPrint: true) ?? ""
    }
    
    override var debugDescription:String {
        return description
    }
}

//Source
class SourceModel: NSObject, Mappable {
    var id: String?
    var name: Int?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    override var description:String {
        return Mapper().toJSONString(self, prettyPrint: true) ?? ""
    }
    
    override var debugDescription:String {
        return description
    }
}
