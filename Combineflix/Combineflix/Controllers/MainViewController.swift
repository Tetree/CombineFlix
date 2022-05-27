//
//  ViewController.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let viewmodel = MainViewModel()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.register(UINib(nibName: "SectionTableViewCell", bundle: nil), forCellReuseIdentifier: SectionTableViewCell.cellIdentifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.cellIdentifier, for: indexPath) as! SectionTableViewCell
        
        cell.configure(with: viewmodel.viewmodelForSection(at: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

