//
//  ViewController.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func showPageOne(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initVC = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        initVC.page = .PageOne
        UIApplication.shared.windows.first!.rootViewController = initVC
        
    }
    @IBAction func showPageTwo(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initVC = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        initVC.page = .PageTwo
        UIApplication.shared.windows.first!.rootViewController = initVC
    }
    @IBAction func showPageThree(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initVC = storyboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        initVC.page = .PageThree
        UIApplication.shared.windows.first!.rootViewController = initVC
    }
}
