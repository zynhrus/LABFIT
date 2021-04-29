//
//  ViewController.swift
//  LABFIT
//
//  Created by Albert . on 24/04/21.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var mealList: UITableView!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    
    var dateList = [1,2,3,4,123,19,20,21,22,23,24,25,26,27,28,29]
    var mealSection : [String] = ["Breakfast","Lunch","Dinner","Snack"]
    
    var foods = [Food]()
    var breakfastFoods = [Food]()
    var lunchFoods = [Food]()
    var dinnerFoods = [Food]()
    var snackFoods = [Food]()
    
    var shuffleBreakfast = true
    var shuffleLunch = true
    var shuffleDinner = true
    var shuffleSnack = true
    
    var toggle = false
    
    var sectionCount = 1
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationitem = UINavigationItem(title: "")
        navigationitem.titleView = DateCollectionViewCell()
        self.navigationController?.navigationBar.items = [navigationitem]
        
        managedObjectContext = appDelegate?.persistentContainer.viewContext as! NSManagedObjectContext
        
        //        heightCount.layer.cornerRadius = heightCount.frame.size.width / 2
        //        heightCount.layer.borderColor = UIColor.white.cgColor
        //        heightCount.layer.borderWidth = 6.0
        //        heightCount.backgroundColor = UIColor.clear
        //
        //        weightCount.layer.cornerRadius = weightCount.frame.size.width / 2
        //        weightCount.layer.borderColor = UIColor.white.cgColor
        //        weightCount.layer.borderWidth = 6.0
        //        weightCount.backgroundColor = UIColor.clear
        
        mealList.dataSource = self
        mealList.delegate = self
        
        setUpCircularProgressBarView()
        setUpTable()
        //        addData(name: "Oatmeal with Berries", cal: 210.4, category: .breakfast, imgType: .png)
        //        deleteData(name: "Slow Cooker Potato Soup")
        loadData()
    }
    
    func addData(name: String, cal: Float, category: category, imgType: imgTypeEnum){
        //1.define entity
        let entity = NSEntityDescription.entity(forEntityName: "Food", in: managedObjectContext)
        //2. define data to be saved to entity
        let entityNew = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
        //3. insert data - name
        
        let img = UIImage(named: name)
        
        if imgType == imgTypeEnum.png {
            let imgData = img!.pngData()
            entityNew.setValue(imgData, forKey: "image")
        } else {
            let imgData = img!.jpegData(compressionQuality: 1)
            entityNew.setValue(imgData, forKey: "image")
        }
        
        entityNew.setValue(name, forKey: "name")
        entityNew.setValue(cal, forKey: "calories")
        entityNew.setValue(category.rawValue, forKey: "category")
        //5. save!
        do {
            try managedObjectContext.save()
            print("save \(entityNew)")
        }catch let error as NSError{
            print("could not save \(error)")
        }
    }
    
    func deleteData(name: String){
        //1. fetch
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Food")
        //2. set predicate
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        
        do {
            let objects = try managedObjectContext.fetch(fetchRequest)
            let objectToBedeleted = objects[0] as! NSManagedObject
            managedObjectContext.delete(objectToBedeleted)
            
            do {
                try managedObjectContext.save()
            }catch let error as NSError{
                print("could not delete \(error)")
            }
            
        }catch{
            print("error saving after deletion")
        }
        loadData()
    }
    
    func loadData(){
        let foodRequest: NSFetchRequest<Food> = Food.fetchRequest()
        do{
            try foods = managedObjectContext.fetch(foodRequest)
            print(foods)
        }catch{
            print("could not load data")
        }
            }
    
    func setUpTable() {
        let nib = UINib(nibName: "MealListTableViewCell", bundle: nil)
        mealList.register(nib, forCellReuseIdentifier: "mealListCell")
    }
    
    func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        // align to the center of the screen
        circularProgressBarView.frame = CGRect(x: view.frame.width/2, y: 240,width: 100, height: 100)
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        // add this view to the view controller
        view.addSubview(circularProgressBarView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
        
        cell.dateNum.text = String(dateList[indexPath.row])
        
        cell.updateCell()
        
        //        collectionView.layoutIfNeeded()
        //        collectionView.scrollToItem(at: IndexPath(row: 5, section: 0), at: .centeredHorizontally, animated: false)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func filterByCategory(category : category) -> ([Food]){
        
        foods.filter { foodList in
            switch category {
            case .breakfast:
                return foodList.category == "Breakfast"
            case .lunch:
                return foodList.category == "Lunch"
            case .snacks:
                return foodList.category == "Snacks"
            case .dinner:
                return foodList.category == "Dinner"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealListCell") as! MealListTableViewCell
        
        print(indexPath.section)
        
        if indexPath.section == 0 {
            if shuffleBreakfast {
                breakfastFoods = filterByCategory(category : .breakfast).shuffled()
                shuffleBreakfast = false
                print("BREAKFAST")
            }
            cell.food = breakfastFoods[indexPath.row]
        }
        if indexPath.section == 1 {
            if shuffleLunch {
                lunchFoods = filterByCategory(category : .lunch).shuffled()
                shuffleLunch = false
                print("LUNCH")
            }
            cell.food = lunchFoods[indexPath.row]
        }
        if indexPath.section == 2 {
            if shuffleDinner {
                dinnerFoods = filterByCategory(category : .dinner).shuffled()
                shuffleDinner = false
                print("DINNER")
            }
            cell.food = dinnerFoods[indexPath.row]
        }
        if indexPath.section == 3 {
            if shuffleSnack {
                snackFoods = filterByCategory(category : .snacks).shuffled()
                shuffleSnack = false
                print("SNACKS")
            }
            cell.food = snackFoods[indexPath.row]
        }
        
//        cell.checkBoxCell.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)
//        cell.checkBoxCell.tag = indexPath.row
        
        cell.updateUI()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @objc func checkMarkButtonClicked ( sender: UIButton) {
         print("button presed")
     
         if sender.isSelected {
             //uncheck the butoon
             sender.isSelected = false
             
         } else {
             // checkmark it
             sender.isSelected = true

         }
     
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealListCell") as! MealListTableViewCell
        
        print(indexPath.section)
        print(indexPath.row)
        
        if(indexPath.section == 0){
            print(breakfastFoods[indexPath.row].name)
            cell.updateCheckBox(condition: true)
        } else if(indexPath.section == 1){
            print(lunchFoods[indexPath.row].name)
            cell.updateCheckBox(condition: true)
        } else if(indexPath.section == 2){
            print(dinnerFoods[indexPath.row].name)
            cell.updateCheckBox(condition: true)
        } else if(indexPath.section == 3){
            print(snackFoods[indexPath.row].name)
            cell.updateCheckBox(condition: true)
        }
        
        
        mealList.reloadData()
        
        print("TAPPPPED")
    }

        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
            let label = UILabel()
            
            label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: 30)
            label.text = "   \(mealSection[section])"
            label.textColor = .black
            
            headerView.addSubview(label)
            headerView.layer.backgroundColor = UIColor.white.cgColor
            
            return headerView
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return mealSection[section]
        }
        
    }
    
    enum category : String{
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case snacks = "Snacks"
    }
    
    enum imgTypeEnum : String {
        case jpeg = "jpeg"
        case png = "png"
    }

struct mealCheck {
    var checkBox : Bool = false
    var Foods : Food
}
