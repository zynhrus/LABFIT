//
//  profileViewController.swift
//  LABFIT
//
//  Created by Josua David on 28/04/21.
//

import UIKit

class profileViewController: UIViewController {

  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var circleButton: UIButton!
    
    var arrZoom: [ZoomBackground] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        addData()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        circleButton.layer.cornerRadius = circleButton.frame.width / 2
        circleButton.layer.masksToBounds = true
         
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.cornerRadius = imageProfile.bounds.width / 2
    }
    
    func setupTable(){
        let nib = UINib(nibName: "TableViewProfileCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableProfile1")
    }
    
    func addData(){
        let age = ZoomBackground(image: "age", tittle: "Age")
        arrZoom.append(age)
        let weight = ZoomBackground(image: "weight", tittle: "My Weight")
        arrZoom.append(weight)
        let height = ZoomBackground(image: "height", tittle: "My Height")
        arrZoom.append(height)
        let BMR = ZoomBackground(image: "bmr", tittle: "Calculator BMR")
        arrZoom.append(BMR)
        let BMI = ZoomBackground(image: "bmi", tittle: "Calculator BMI")
        arrZoom.append(BMI)
        
    }
    
}

extension profileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrZoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableProfile1") as! TableViewProfileCell
        
        cell.zoomBackground = arrZoom[indexPath.row]
        cell.updateUI()
        
        return cell
    }
}

extension profileViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 6
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
               self.performSegue(withIdentifier: "showInfo", sender: self)
        } else if indexPath.row == 1 {
               self.performSegue(withIdentifier: "showInfo", sender: self)
        } else if indexPath.row == 2 {
                   self.performSegue(withIdentifier: "showInfo", sender: self)
        } else if indexPath.row == 3 {
            self.performSegue(withIdentifier: "showBmr", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let indexPathForSelectedRow = self.tableView.indexPathForSelectedRow
        print("\(String(describing: indexPathForSelectedRow))")
        return indexPath
    }
}
