//
//  PageOneViewController.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

class PageOneViewController: UIViewController {

    @IBOutlet weak var addFriendsButton: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var infoLinkLabel: UILabel!
    var viewModel = FriendInfoViewModel()
    let shadowColor = #colorLiteral(red: 0.4745098039, green: 0.768627451, blue: 0.6, alpha: 1)
    let frogGreen = #colorLiteral(red: 0.337254902, green: 0.7019607843, blue: 0.0431372549, alpha: 1)
    let booger = #colorLiteral(red: 0.6509803922, green: 0.8, blue: 0.2588235294, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonBackgroundView.dropShadow(color: shadowColor, offSet: CGSize(width: 0, height: 4), radius: 20)
        let layer1 = addFriendsButton.addGradientLayer(colors: [frogGreen.cgColor, booger.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        layer1.locations = [0,1]
        addFriendsButton.layer.addSublayer(layer1)
        
        let attributedString = NSMutableAttributedString(string: "幫助好友更快找到你？設定 KOKO ID", attributes: [
          .font: UIFont(name: "PingFangTC-Regular", size: 13.0)!,
          .foregroundColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        ])
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 236, green: 0, blue: 140, alpha: 1), range: NSRange(location: 10, length: 10))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 10, length: 10))
        infoLinkLabel.attributedText = attributedString

        viewModel.getNoFriendsValue {}
    }
    

    
    
}
