//
//  AddMealPageViewController.swift
//  LABFIT
//
//  Created by Josua David on 26/04/21.
//

import UIKit

class Serving {
    
    var jumlah: String
    var pecahan: [String]
    var satuan: [String]
    
    init(jumlah:String, pecahan:[String], satuan:[String]){
        self.jumlah = jumlah
        self.pecahan = pecahan
        self.satuan = satuan
    }
}

class AddMealPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var serving = [Serving]()
    
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        serving.append(Serving(jumlah:"1", pecahan:["1/8","1/4","1/3"], satuan:["Ounces","Pounds","Grams"]))
        serving.append(Serving(jumlah:"2", pecahan:["1/8","1/4","1/3"], satuan:["Ounces","Pounds","Grams"]))
        serving.append(Serving(jumlah:"3", pecahan:["1/8","1/4","1/3"], satuan:["Ounces","Pounds","Grams"]))
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return serving.count
        } else {
            let selectedServing = pickerView.selectedRow(inComponent: 0)
            return serving[selectedServing].jumlah.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return serving[row].jumlah
        } else {
            let selectedServing = pickerView.selectedRow(inComponent: 0)
            return serving[selectedServing].pecahan[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
