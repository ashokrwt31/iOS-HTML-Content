//
//  ViewController.swift
//  EduRev
//
//  Created by Ashok Rawat on 22/11/20.
//  Copyright © 2020 Ashok Rawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var questionViewModel = ERQuestionViewModel ()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetUp()
    }
    
    // MARK: - InitialSetUp for table and reloading
    func initialSetUp() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.register(UINib(nibName: "ERQuestionCell", bundle: nil), forCellReuseIdentifier: "ERQuestionCell")
        tableView.dataSource = questionViewModel
        tableView.delegate   = questionViewModel
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView? = UIView(frame: CGRect.zero)
        if(questionViewModel.fetchDataFromLocalJsonFile()) {
            tableView.reloadData()
            tableView.layoutIfNeeded()
        }
    }
}


