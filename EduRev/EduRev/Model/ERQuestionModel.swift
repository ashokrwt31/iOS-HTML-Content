//
//  ERQuestionModel.swift
//  EduRev
//
//  Created by Ashok Rawat on 22/11/20.
//  Copyright © 2020 Ashok Rawat. All rights reserved.
//

import Foundation

struct ERQuestionModel {
    var pAnsUserName: String!
    var auName: String!
    var fPost: String!
    var pAnswer: String!
    
    init(_ data: NSDictionary) {
        self.pAnsUserName      = data["pAnsUserName"] as? String
        self.auName            = data["auName"] as? String
        self.fPost             = data["fPost"] as? String
        self.pAnswer           = data["pAnswer"] as? String
    }
}
