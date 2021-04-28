//
//  DateCollectionViewCell.swift
//  LABFIT
//
//  Created by Albert . on 25/04/21.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var date: UIView!
    @IBOutlet weak var dateNum: UILabel!

    func updateCell(){
        date.layer.cornerRadius = date.frame.size.width / 2
        date.layer.borderColor = UIColor(red: 88/255.0, green: 159/255.0, blue: 149/255.0, alpha: 1.0).cgColor
        date.layer.borderWidth = 4.0
        date.backgroundColor = UIColor.clear
        dateNum.textColor = UIColor.white
    }
}
