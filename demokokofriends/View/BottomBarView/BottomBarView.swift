//
//  BottomBarView.swift
//  demokokofriends
//
//  Created by yen fu Chen on 2023/2/15.
//

import UIKit

@IBDesignable
class BottomBarView: UIView, NibOwnerLoadable  {
    
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
    }

}
