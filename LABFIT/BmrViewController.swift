import UIKit

class BmrViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    

    @IBOutlet weak var genderTxt: UITextField!
    let gender = ["Laki-laki","Perempuan"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderTxt.inputView = pickerView
        genderTxt.textAlignment = .center
        genderTxt.placeholder = "Select Gender"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTxt.text = gender[row]
        genderTxt.resignFirstResponder()
    }

}
