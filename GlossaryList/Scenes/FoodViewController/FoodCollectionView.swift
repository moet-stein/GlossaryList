//
//  MealCollectionViewCell.swift
//  GlossaryList
//
//  Created by Moe Steinmueller on 28.02.22.
//

import UIKit

class FoodCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var ingredientsAmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }

    
    func setup(foodModel: Food) {
        foodNameLabel.text = foodModel.name
        if let ingredientsAmount = foodModel.ingredients?.amount {
            ingredientsAmountLabel.text = "Ingredients: \(ingredientsAmount)"
        } else {
            ingredientsAmountLabel.text = "Ingredients: 0"
        }
    }
    

}
