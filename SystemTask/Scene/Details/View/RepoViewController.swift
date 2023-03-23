//
//  RepoViewController.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 23/03/2023.
//

import UIKit

class RepoViewController: UIViewController {
    @IBOutlet weak var repoName : UILabel!
    @IBOutlet weak var commitTableView : UITableView!
    var viewModel : RepoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repoName.text = viewModel.name
        // Do any additional setup after loading the view.
    }
    @IBAction func dismiss(_ sender : UIButton){
        self.dismiss(animated: true)
    }
}
extension RepoViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "commit"
        return cell
    }
}
