//
//  ArticleResponse.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleResponse: BaseNewsModel {
    var articles: [ArticleModel]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        articles <- map["articles"]
    }
    
    override var description:String {
        return Mapper().toJSONString(self, prettyPrint: true) ?? ""
    }
    
    override var debugDescription:String {
        return description
    }
}
