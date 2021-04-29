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
    @IBOutlet weak var checkBox: UIImageView!
    
    var food: Food!
    
    func updateUI(){
        titleCell.text = food.name
        caloriesCell.text = "\(String(food.calories)) calories"
        imageCell.image = UIImage(data: food.image! as Data)
//        imageCell.image = UIImage(named: "bacon")
        imageCell.layer.cornerRadius = 15
    }
    
    func updateCheckBox(condition: Bool){
        print(condition)
        if condition == true {
            self.titleCell.text = "TESTING"
            
        } else {
            self.titleCell.text = "NOT TESTING"
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
