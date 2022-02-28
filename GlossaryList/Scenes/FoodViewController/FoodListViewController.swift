//
//  ViewController.swift
//  GlossaryList
//
//  Created by Moe Steinmueller on 25.02.22.
//

import UIKit
import CoreData

class FoodListViewController: UIViewController {
    
    @IBOutlet weak var foodCollectionView: UICollectionView!

    
    var foodArray = [Food]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        loadFood()
    }
    
    // MARK: - Data Manipulation Methods
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.foodCollectionView.reloadData()
    }

    func loadFood(with request: NSFetchRequest<Food> = Food.fetchRequest()) {
        do {
            foodArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        self.foodCollectionView.reloadData()
    }

    @IBAction func addFoodPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Food", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { action in
            
            let newFood = Food(context: self.context)
            
            newFood.name = textField.text!
            newFood.checked = false
            
            self.foodArray.append(newFood)
            
            self.saveItems()
            
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new food"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension FoodListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! FoodCollectionView
        
        cell.setup(foodModel: foodArray[indexPath.item])
        return cell
    }
        
    
}
