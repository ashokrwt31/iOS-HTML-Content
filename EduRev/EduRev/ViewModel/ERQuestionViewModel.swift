//
//  ERQuestionViewModel.swift
//  EduRev
//
//  Created by Ashok Rawat on 22/11/20.
//  Copyright © 2020 Ashok Rawat. All rights reserved.
//

import Foundation
import UIKit

class ERQuestionViewModel: NSObject {
    fileprivate let jsonResponse = "EduRevResponse"
    var questionItems: [ERQuestionModel] = []
    
    // MARK: - Parse json data and fill model
    
    func fetchDataFromLocalJsonFile() -> Bool {
        let jsonData = self.readDataFromFile(self.jsonResponse)
        if let _ = jsonData {
            do {
                let jsonDict = try JSONSerialization.jsonObject(with: jsonData!) as! NSArray
                self.createQuestionModel(jsonDict)
                return true
            }
            catch {
            }
        }
        return false
    }
    
    private func readDataFromFile(_ fileName: String) -> Data? {
        var resultjsonFile: Data?
        guard let filePath = Bundle.main.url(forResource: jsonResponse, withExtension: "json") else { return nil }
        
        if let data =  NSData(contentsOf: filePath) {
            resultjsonFile = data as Data
        }
        return resultjsonFile
    }
    
    private func createQuestionModel(_ dataArray: NSArray) {
        for item in dataArray {
            questionItems.append(ERQuestionModel.init(item as! NSDictionary))
        }
    }
}

// MARK: - Datasource and delegate of TableView
extension ERQuestionViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ERQuestionCell") as! ERQuestionCell
        cell.configureCell(questionItems[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let aView = UIView()
        aView.backgroundColor = UIColor.clear
        return aView
    }
}
