//
//  ViewController.swift
//  LABFIT
//
//  Created by Albert . on 24/04/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var countingLabel: UILabel!
//    @IBOutlet weak var heightCount: UIView!
//    @IBOutlet weak var weightCount: UIView!
    @IBOutlet weak var mealList: UITableView!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    
    var dateList = [1,2,3,4,123,19,20,21,22,23,24,25,26,27,28,29]
    var meals: [Food] = []
    var mealSection : [String] = ["Breakfast","Lunch","Dinner","Snack"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationitem = UINavigationItem(title: "")
        navigationitem.titleView = DateCollectionViewCell()
        self.navigationController?.navigationBar.items = [navigationitem]
        
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
        addData()
    }
    
    func setUpTable() {
        let nib = UINib(nibName: "MealListTableViewCell", bundle: nil)
        mealList.register(nib, forCellReuseIdentifier: "mealListCell")
    }
    
    func addData(){
        let a = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 100, image: "bacon", checkBox: true, category: "Breakfast")
        let b = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 200, image: "bacon", checkBox: true, category: "Breakfast")
        let c = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 300, image: "bacon", checkBox: true, category: "Lunch")
        let d = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 400, image: "bacon", checkBox: true, category: "Lunch")
        let e = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 500, image: "bacon", checkBox: true, category: "Snack")
        let f = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 600, image: "bacon", checkBox: true, category: "Dinner")
        let g = Food(foodName: "Bacon and Broccoli Rice Bowl", calories: 700, image: "bacon", checkBox: true, category: "Dinner")
        meals.append(a)
        meals.append(b)
        meals.append(c)
        meals.append(d)
        meals.append(e)
        meals.append(f)
        meals.append(g)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealListCell") as! MealListTableViewCell
        
        cell.food = meals[0]
        cell.updateUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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
