//
//  ERQuestionCell.swift
//  EduRev
//
//  Created by Ashok Rawat on 22/11/20.
//  Copyright © 2020 Ashok Rawat. All rights reserved.
//

import Foundation
import UIKit

class ERQuestionCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var userIntractionView: UIView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        self.selectionStyle = .none
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowOffset = CGSize.init(width: 0, height: 4)
        self.layer.shadowColor =  UIColor.lightGray.cgColor
        self.layer.shadowRadius = 4;
    }
    
    // MARK: - configure table view cell with data item
    
    func configureCell(_ item: ERQuestionModel) {
        userName.text = item.auName + " answered"
        questionLabel.attributedText = item.fPost.convertToAttributedFromHTML()
        answerLabel.attributedText = item.pAnswer.htmlToAttributedString
    }
}


