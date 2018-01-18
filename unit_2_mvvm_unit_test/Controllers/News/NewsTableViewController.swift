//
//  NewsTableViewController.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    var viewModel: MainInterface!
    
    func setUpTableView() {
        tableView.register(UINib(nibName: NewsTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.Identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configure(_ interface: MainInterface) {
        self.viewModel = interface
        bindToViewModel()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.output.articles?.count ?? 0
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.Identifier, for: indexPath) as! NewsTableViewCell
        let item = viewModel.output.articles?[indexPath.row]
        // Configure the cell...
        cell.render(data: item)

        return cell
    }
}

//MARK: - Binding
extension NewsTableViewController {
    
    func bindToViewModel() {
    }
}
