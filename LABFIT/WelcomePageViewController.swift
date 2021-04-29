//
//  WelcomePageViewController.swift
//  LABFIT
//
//  Created by Sukma Risfa Sam Bima Yudha on 28/04/21.
//

import UIKit
import CoreData

class WelcomePageViewController: UIViewController {

    // Outlet Page 1
    @IBOutlet weak var btnGainW: UIButton!
    @IBOutlet weak var btnMaintainW: UIButton!
    @IBOutlet weak var btnLossW: UIButton!
    
    // Outlet Page 2
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var txtFieldAge: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    var isChecked = false
    
    // Outlet page 3
    @IBOutlet weak var txtFieldHeight: UITextField!
    @IBOutlet weak var txtFieldWeight: UITextField!
    @IBOutlet weak var btnNextHeight: UIButton!
    @IBOutlet weak var btnNextWeight: UIButton!
    
    
    // 1. Initializing the entity
    var userData = [User]()
    var Goals:String = ""
    var Name:String = "Guest"
    var Gender:String = ""
    var Age:Int16 = 0
    var Height:Float = 0
    var Weight:Float = 0
    var Activity:String = ""
    
    // 2. initializing manageOBjectContext
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    // 3. a referebce AppDelegate
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = appDelegate?.persistentContainer.viewContext as! NSManagedObjectContext
        
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        print("Skip")
    }
    
    @IBAction func btnGainWeightTouch(_ sender: Any) {
        Goals = "Gain"
    }

    
    @IBAction func btnMtWeightTouch(_ sender: Any) {
        Goals = "Maintain"
    }
    
    
    @IBAction func btnLossWeightTouch(_ sender: Any) {
        Goals = "Loss"
    }
    
    
    @IBAction func btnMale(_ sender: Any) {
        Gender = "Male"
        isChecked = true
        if isChecked {
            btnMale.backgroundColor = .systemTeal
            btnFemale.backgroundColor = .systemBlue
        } else {
            btnMale.backgroundColor = .systemBlue
            btnFemale.backgroundColor = .systemTeal
        }
        
        if (txtFieldAge.text != ""){
            btnNextPressed(sender)
        }
    }
    
    @IBAction func btnFemale(_ sender: Any) {
        Gender = "Female"
        isChecked = false
        if isChecked {
            btnMale.backgroundColor = .systemTeal
            btnFemale.backgroundColor = .systemBlue
        } else {
            btnMale.backgroundColor = .systemBlue
            btnFemale.backgroundColor = .systemTeal
        }
        
        if (txtFieldAge.text != ""){
            btnNextPressed(sender)
        }
    }
    
    @IBAction func txtFieldAgeChange(_ sender: Any) {
        if txtFieldAge.text == ""{
            btnNext.isHidden = true
        } else if (btnMale.backgroundColor ==  btnFemale.backgroundColor)
        {
            btnNext.isHidden = true
        }
        else {
            btnNext.isHidden = false
        }
    }
    

    @IBAction func txtAgeEditEnd(_ sender: Any) {
        Age = Int16(txtFieldAge.text!)!
    }
    
    
    @IBAction func txtHeight(_ sender: Any) {
        Height = Float(txtFieldHeight.text!)!
        
        if (txtFieldWeight.text != ""){
            btnNextHeight.isHidden = false
        } else {
            btnNextHeight.isHidden = true
        }
    }
    
    @IBAction func txtHeightChange(_ sender: Any) {
        if (txtFieldWeight.text != ""){
            btnNextHeight.isHidden = false
        } else {
            btnNextHeight.isHidden = true
        }
    }
    
    
    
    
    @IBAction func txtWeight(_ sender: Any) {
        Weight = Float(txtFieldWeight.text!)!
        
        if (txtFieldHeight.text != ""){
            btnNextWeight.isHidden = false
        } else {
            btnNextWeight.isHidden = true
        }
    }
    
    @IBAction func txtWeightChange(_ sender: Any) {
        if (txtFieldHeight.text != ""){
            btnNextWeight.isHidden = false
        } else {
            btnNextWeight.isHidden = true
        }
    
    }
    
    
    @IBAction func btnSedetary(_ sender: Any) {
        Activity = "Sedetary"
        addGoal()
    }
    
    @IBAction func btnLightly(_ sender: Any) {
        Activity = "Lightly"
        addGoal()
    }
    
    @IBAction func btnModeraly(_ sender: Any) {
        Activity = "Moderately"
        addGoal()
    }
    
    @IBAction func btnVery(_ sender: Any) {
        Activity = "Very"
        addGoal()
    }
    
    @IBAction func btnNextPressed(_ sender: Any) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "page3") as UIViewController, animated: true)
    }
    
    @IBAction func bntNextHeightPressed(_ sender: Any) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "page4") as UIViewController, animated: true)
    }
    
    @IBAction func btnNextWeightPressed(_ sender: Any) {
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "page4") as UIViewController, animated: true)
    }
    
    func addGoal() {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedObjectContext)
        let newGoal = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        
        newGoal.setValue(Name, forKey: "name")
        newGoal.setValue(Goals, forKey: "goal")
        newGoal.setValue(Gender, forKey: "gender")
        newGoal.setValue(Age, forKey: "age")
        newGoal.setValue(Height, forKey: "height")
        newGoal.setValue(Weight, forKey: "weight")
        newGoal.setValue(Activity, forKey: "activity")
        
        do {
            try managedObjectContext.save()
        } catch {
            print(" Error \(error) ")
        }
    }
    
    
   
    func loadData(){
        let goalRequest:NSFetchRequest<User> = User.fetchRequest()
        let sort = [NSSortDescriptor(key: "goal", ascending: true)]
        goalRequest.sortDescriptors = sort
        do {
            try userData = managedObjectContext.fetch(goalRequest)
            for result in userData{
                print(" User Name = \(result.name!) || User Goal = \(result.goal!)")
                print(" User Gender = \(result.gender!) || User Age = \(result.age)")
                print(" User Height = \(result.height) || User Goal = \(result.weight)")
                print(" User Activity = \(result.activity!)")
            }
        } catch {
            print(" Error : \(error)")
        }
    }
    
//    func deleteData() {
//        let name:String = "Loss"
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "goal = %@", name)
//        do {
//            let object = try managedObjectContext.fetch(fetchRequest)
//            let objectToDelete = object[0] as! NSManagedObject
//            managedObjectContext.delete(objectToDelete)
//        } catch {
//            print("Error")
//        }
//    }

}
