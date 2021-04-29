//
//  TableViewProfileCell.swift
//  LABFIT
//
//  Created by Josua David on 28/04/21.
//

import UIKit

class TableViewProfileCell: UITableViewCell {

    @IBOutlet weak var image_cell: UIImageView!
    @IBOutlet weak var tittle_cell: UILabel!
    
    var zoomBackground:ZoomBackground!
    
    func updateUI(){
        image_cell.image = UIImage(named: zoomBackground.image)
        tittle_cell.text = zoomBackground.tittle
        image_cell?.layer.cornerRadius = 5
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

struct ZoomBackground {
    var image:String!
    var tittle:String!
}
