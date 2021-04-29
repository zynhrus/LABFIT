//
//  ViewController.swift
//  LABFIT
//
//  Created by Albert . on 24/04/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var heightCount: UIView!
    @IBOutlet weak var weightCount: UIView!
    
    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 2
    
    var dateList = [1,2,3,4,123,19,20,21,22,23,24,25,26,27,28,29]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationitem = UINavigationItem(title: "")
        navigationitem.titleView = DateCollectionViewCell()
        self.navigationController?.navigationBar.items = [navigationitem]
        
        heightCount.layer.cornerRadius = heightCount.frame.size.width / 2
        heightCount.layer.borderColor = UIColor.white.cgColor
        heightCount.layer.borderWidth = 6.0
        heightCount.backgroundColor = UIColor.clear
        
        weightCount.layer.cornerRadius = weightCount.frame.size.width / 2
        weightCount.layer.borderColor = UIColor.white.cgColor
        weightCount.layer.borderWidth = 6.0
        weightCount.backgroundColor = UIColor.clear
        
        setUpCircularProgressBarView()
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
}

