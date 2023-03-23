//
//  HomeListViewController.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import UIKit

class HomeListViewController: UIViewController {
    @IBOutlet weak var reposTableView : UITableView!
    @IBOutlet weak var activityIndictor : UIActivityIndicatorView!
    private let viewModel = HomeViewModel()
    var expandable : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchReposFromCoreData {
            self.reposTableView.reloadData()
        }
        activityIndictor.startAnimating()
        viewModel.fetchRepos {
            DispatchQueue.main.async {
                self.reposTableView.reloadData()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {[weak self] in
                if let self = self{
                    self.expandable = true
                    self.activityIndictor.startAnimating()
                    self.activityIndictor.isHidden = true
                    self.reposTableView.reloadData()
                }
            }
        }
    }
}
extension HomeListViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if self.expandable
        {
           return 3
       }
        else{
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfRepos
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var repoViewModel = viewModel.repoAtIndex(indexPath.section)
        if let detailsRepoViewController = self.storyboard?.instantiateViewController(withIdentifier: "repoViewController") as? RepoViewController {
            detailsRepoViewController.modalPresentationStyle = .fullScreen
            detailsRepoViewController.viewModel = repoViewModel
            self.present(detailsRepoViewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reposTableView.dequeueReusableCell(withIdentifier: "CommitCell" , for : indexPath) as? CommitTableViewCell
        cell?.textLabel?.text = "commit"
        cell?.dropOnlyOneShadowLeft(getSize: .zero)
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderSectionRow") as? RepoTableViewCell
        let movieViewModel = viewModel.repoAtIndex(section)
        cell?.repoNameLBL?.text = movieViewModel.name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension UIView {
    func dropOnlyOneShadowLeft(getSize: CGSize) {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = getSize
        self.layer.shadowRadius = 3
    }
}
