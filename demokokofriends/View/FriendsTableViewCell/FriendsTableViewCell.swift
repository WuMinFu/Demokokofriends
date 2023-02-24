//
//  FriendsTableViewCell.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var starFriendsImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var invitationStatusButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
