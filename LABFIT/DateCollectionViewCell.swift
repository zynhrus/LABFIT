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
    }
}
