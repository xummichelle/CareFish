//
//  CheckListViewController.swift
//  CareFish
//
//  Created by Michelle Xu on 2023-09-23.
//

import UIKit

class ChecklistItem {
    let title: String
    var isChecked: Bool = false
    
    init(title: String) {
        self.title=title
    }
}
final class CheckListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var daily_tasks_header: UILabel!
    @IBOutlet weak var header: UIImageView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return daily_tasks_header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        let checked_box: UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        checked_box.image = UIImage(named:"checked.png")
            checked_box.contentMode = .scaleAspectFit
        
        let unchecked_box: UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        checked_box.image = UIImage(named:"unchecked.png")
            unchecked_box.contentMode = .scaleAspectFit
        cell.imageView!.image = item.isChecked ? UIImage(named:"checked.png") : UIImage(named:"unchecked.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        item.isChecked = !item.isChecked
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    let items: [ChecklistItem] = [
    "Get Groceries",
    "Clean Room",
    "Exercise"].compactMap({ChecklistItem(title: $0)})
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
}
