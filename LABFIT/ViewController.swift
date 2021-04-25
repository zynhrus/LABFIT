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
    
    var dateList = [25,24,23,22,21,20,19]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightCount.layer.cornerRadius = heightCount.frame.size.width / 2
        weightCount.layer.cornerRadius = weightCount.frame.size.width / 2
        
        setUpCircularProgressBarView()
    }
    
    func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: .zero)
        // align to the center of the screen
        circularProgressBarView.frame = CGRect(x: view.frame.width/2, y: 200,width: 100, height: 100)
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
        
        return cell
    }
}

