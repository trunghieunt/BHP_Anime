//
//  MenuCell.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/5/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var outletBtn1: UIButton!
    @IBOutlet weak var outletBtn2: UIButton!
    @IBOutlet weak var outletBtn3: UIButton!
    
    var doneAction: (Int)->() = {_ in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        outletBtn1.setTitleColor(AppColors.grayText, for: .normal)
        outletBtn2.setTitleColor(AppColors.grayText, for: .normal)
        outletBtn3.setTitleColor(AppColors.grayText, for: .normal)
        
        outletBtn1.setTitleColor(AppColors.blackText, for: .selected)
        outletBtn2.setTitleColor(AppColors.blackText, for: .selected)
        outletBtn3.setTitleColor(AppColors.blackText, for: .selected)
        
        outletBtn1.tag = 1
        outletBtn2.tag = 2
        outletBtn3.tag = 3
        
        outletBtn1.isSelected = true
        
    }
    
    @IBAction func actionBtn1(_ sender: UIButton) {
        
        if sender.isSelected{
            return
        }
        
        outletBtn1.isSelected = false
        outletBtn2.isSelected = false
        outletBtn3.isSelected = false
        
        sender.isSelected = true
        self.doneAction(sender.tag)
    }
    
}
