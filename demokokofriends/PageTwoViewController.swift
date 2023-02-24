//
//  PageTwoViewController.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

class PageTwoViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var friendsTableView: UITableView!
    var refreshControl = UIRefreshControl()
    var viewModel = FriendInfoViewModel()
    var filterFriends: [FriendInfoModel] = []
    var hasOtherFriends = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setRefresh()
    }
    func setRefresh(){
        self.refreshControl.tintColor = .lightGray
        self.refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        friendsTableView.refreshControl = refreshControl
    }
    @objc func refresh(sender: AnyObject) {
        getFriendsValue()    }
    func checkRefreshEnd(){
        if refreshControl.isRefreshing{
            refreshControl.endRefreshing()
        }
    }
    func getFriendsValue(){
        viewModel.getValues { [weak self] in
            DispatchQueue.main.async {
                self?.checkRefreshEnd()	
                self?.filterFriends = self?.viewModel.friendsInfo ?? []
                self?.friendsTableView.reloadData()
            }
        }
    }
    func getOtherFriendsValue(){
        viewModel.getOtherValue { [weak self] in
            DispatchQueue.main.async {
                self?.filterFriends = self?.viewModel.friendsInfo ?? []
                self?.friendsTableView.reloadData()
                self?.reloadOtherFriends()
            }
        }
    }
    
    func reloadOtherFriends(){
        if hasOtherFriends, let homeVC = self.parent as? HomeViewController{
            homeVC.topBarViewHeight.constant += CGFloat(viewModel.otherInfo.count * 100)
            homeVC.topBarView.otherInfo = viewModel.otherInfo
        }
    }
}
extension PageTwoViewController: UITextFieldDelegate {
    // textField輸入後
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == searchTextField{
            searchFriendsTableView()
        }
    }
    //textField按下Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func searchFriendsTableView(){
        if searchTextField.text != "" {
            filterFriends = viewModel.friendsInfo.filter({
                return $0.name.contains(searchTextField.text!)
            })
        }else {
            filterFriends = viewModel.friendsInfo
        }
        friendsTableView.reloadData()
        	
    }
}
    
extension PageTwoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = filterFriends[indexPath.row].name
        if filterFriends[indexPath.row].isTop == "1"{
            cell.starFriendsImageView.isHidden = false
        }else {
            cell.starFriendsImageView.isHidden = true
        }
        if filterFriends[indexPath.row].status == 2{
            cell.invitationStatusButton.isHidden = false
            cell.setButton.isHidden = true
        }else {
            cell.invitationStatusButton.isHidden = true
            cell.setButton.isHidden = false
        }
        return cell
    }
    
    
}
