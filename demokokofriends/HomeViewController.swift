//
//  ViewController.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit
enum Page {
    case PageOne
    case PageTwo
    case PageThree
}

class HomeViewController: UIViewController {
    @IBOutlet weak var topBarView: TopBarView!
    @IBOutlet weak var topBarViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pageView: UIView!
    lazy var PageOneVC: PageOneViewController = {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageOne") as! PageOneViewController
    }()
    lazy var PageTwoVC: PageTwoViewController = {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PageTwo") as! PageTwoViewController
    }()
    var page: Page = .PageOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch page {
        case .PageOne:
            initPageOneView()
        case .PageTwo:
            initPageTwoView()
        case .PageThree:
            initPageThreeView()
        }
    }
    private func initPageOneView(){
        addChild(PageOneVC)
        pageView.addSubview(PageOneVC.view)
        PageOneVC.view.frame = pageView.bounds
        PageOneVC.didMove(toParent: self)
    }
    private func initPageTwoView(){
        addChild(PageTwoVC)
        pageView.addSubview(PageTwoVC.view)
        PageTwoVC.view.frame = pageView.bounds
        PageTwoVC.didMove(toParent: self)
        PageTwoVC.getFriendsValue()
    }
    private func initPageThreeView(){
        addChild(PageTwoVC)
        pageView.addSubview(PageTwoVC.view)
        PageTwoVC.view.frame = pageView.bounds
        PageTwoVC.didMove(toParent: self)
        PageTwoVC.hasOtherFriends = true
        PageTwoVC.getOtherFriendsValue()
        
    }
}

