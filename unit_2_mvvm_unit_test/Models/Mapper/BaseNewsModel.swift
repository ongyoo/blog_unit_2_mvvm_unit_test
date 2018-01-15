//
//  BaseNewsModel.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseNewsModel: NSObject, Mappable {
    
    var status: String?
    var totalResults: Int?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
    }
    
    override var description:String {
        return Mapper().toJSONString(self, prettyPrint: true) ?? ""
    }
    
    override var debugDescription:String {
        return description
    }
}
