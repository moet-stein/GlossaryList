//
//  MealCollectionViewCell.swift
//  GlossaryList
//
//  Created by Moe Steinmueller on 28.02.22.
//

import UIKit

class FoodCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.borderColor = CGColor(red: 1, green: 1, blue: 2, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func setup(foodModel: Food) {
        foodNameLabel.text = foodModel.name
    }
}
