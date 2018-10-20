//
//  DetailedRocketLaunchViewController.swift
//  RocketLaunches
//
//  Created by Alexandru Turcanu on 20/10/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import UIKit

class DetailedRocketLaunchViewController: UIViewController {

    @IBOutlet private weak var rocketLaunchTableView: UITableView!
    
    var rocketLaunch: RocketLaunch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureRocketLaunchTableView()
    }
    
    private func configureRocketLaunchTableView() {
        rocketLaunchTableView.allowsSelection = false
        
        rocketLaunchTableView.rowHeight = UITableView.automaticDimension
        
        rocketLaunchTableView.dataSource = self
        rocketLaunchTableView.delegate = self
    }

}

extension DetailedRocketLaunchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketLaunchTableViewCell.identifier, for: indexPath) as? RocketLaunchTableViewCell else {
                assertionFailure("somebody is dumb")
                return UITableViewCell()
            }
            
            cell.reloadData(for: rocketLaunch)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MissionTableViewCell.identifier, for: indexPath) as? MissionTableViewCell else {
                assertionFailure("somebody is dumb")
                return UITableViewCell()
            }
            
            cell.reloadData(for: rocketLaunch)
            return cell
            
        default:
            fatalError()
        }
        
        
    }
    
    
}

extension DetailedRocketLaunchViewController: UITableViewDelegate {
    
}