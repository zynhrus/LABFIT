//
//  MealListTableViewCell.swift
//  LABFIT
//
//  Created by Albert . on 28/04/21.
//

import UIKit

class MealListTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var caloriesCell: UILabel!
    @IBOutlet weak var checkBoxCell: UIImageView!
    
    var food: Food!
    
    func updateUI(){
        titleCell.text = food.foodName
        caloriesCell.text = "\(String(food.calories)) calories"
        imageCell.image = UIImage(named: food.image)
        imageCell.layer.cornerRadius = 15
        checkBoxCell.layer.cornerRadius = 5
        if food.checkBox {
            checkBoxCell.image = UIImage(systemName: "checkmark.square.fill")
        } else {
            self.imageCell.image = UIImage(systemName: "checkmark.square")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

struct Food {
    var foodName:String
    var calories:Int
    var image:String
    var checkBox:Bool
    var category:String
}
