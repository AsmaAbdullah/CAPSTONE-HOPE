//
//  MeasuresVC.swift
//  HOPE
//
//  Created by Asma on 03/01/2022.
//

import UIKit

class MeasuresVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var measures = [MeasuresInfo]()
    var selsectedMeasures: MeasuresInfo!
    
    
    @IBOutlet weak var measuresCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        measuresCollectionView.delegate = self
        measuresCollectionView.dataSource = self
        
        measures.append(MeasuresInfo.init(title: "Depression Measurement", image: UIImage(resource: .Session3)!))
        measures.append(MeasuresInfo.init(title: "Tension Measurement", image: UIImage(resource: .Session1)!))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return measures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! MeasuresCollectionViewCell
        item.titleMeasure.text = measures[indexPath.row].title
        item.imageMeasure.image = measures[indexPath.row].image
        return item
    }
    
    // MARK:  Spaces between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: -
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selsectedMeasures = measures[indexPath.row]
        performSegue(withIdentifier: "toQuestions", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? MeasurementQuestions {
            vc.selsectedMeasures = selsectedMeasures
        }
    }
    
}

