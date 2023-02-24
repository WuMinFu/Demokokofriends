//
//  TopBarView.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

@IBDesignable
class TopBarView: UIView, NibOwnerLoadable {
    @IBOutlet weak var tableView: UITableView!
    var otherInfo: [FriendInfoModel] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit(){
        loadNibContent()
        self.tableView.register(OtherFriendsTableViewCell.nib, forCellReuseIdentifier: OtherFriendsTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}
extension TopBarView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otherInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OtherFriendsTableViewCell.identifier, for: indexPath) as? OtherFriendsTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = otherInfo[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
