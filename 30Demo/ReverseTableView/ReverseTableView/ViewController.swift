//
//  ViewController.swift
//  ReverseTableView
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var messages: [MessageModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.transform = CGAffineTransform.identity.rotated(by: .pi)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        messages.append(MessageModel())
        let index = reversedIndexPath(with: IndexPath(row: messages.count - 1, section: 0), fromReversed: true)
        tableView.insertRows(at: [index], with: .automatic)
    }
    
    @IBAction func trashButtonTapped(_ sender: UIBarButtonItem) {
        messages.removeAll()
        tableView.reloadData()
    }
    
    
    // MARK: - Function
    
    func reversedIndexPath(with indexPath: IndexPath, fromReversed reversed: Bool = false) -> IndexPath {
        let base = tableView
        let section = max(0, max(0, ((base?.numberOfSections)! - 1)) - indexPath.section)
        let numberOfRowsInSection = base?.numberOfRows(inSection: reversed ? section : indexPath.section)
        let row = max(0, numberOfRowsInSection! - 1 - indexPath.row)
        return IndexPath(row: row, section: section)
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexPath = reversedIndexPath(with: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        (cell as? TableViewCell)?.configure(with: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.contentView.transform == CGAffineTransform.identity {
            UIView.setAnimationsEnabled(false)
            cell.contentView.transform = CGAffineTransform.identity.rotated(by: .pi)
            UIView.setAnimationsEnabled(true)
        }
    }
    
}

