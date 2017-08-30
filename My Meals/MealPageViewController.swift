//
//  MealPageViewController.swift
//  My Meals
//
//  Created by gina iliff on 8/29/17.
//  Copyright © 2017 gina iliff. All rights reserved.
//

import UIKit

class MealPageViewController: UIViewController {
    
    var previousVC = MealTableViewController()
    var selectedMeal : Meal?

    @IBOutlet weak var mealPageDescriptionLabel: UILabel!
    @IBOutlet weak var mealPageImageLabel: UIImageView!
    @IBOutlet weak var healthyLabel: UILabel!
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var overateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mealPageDescriptionLabel.text = selectedMeal?.mealDescription
        
        if selectedMeal?.healthy == true {
            healthyLabel.text = "This meal was healthy"
        } else {
            healthyLabel.text = "This meal was not healthy"
        }
        
        if selectedMeal?.glutenFree == true {
            glutenFreeLabel.text = "This meal was gluten free"
        } else {
            glutenFreeLabel.text = "This meal had gluten"
        }
        
        if selectedMeal?.overeat == true {
            overateLabel.text = "I ate too much"
        } else {
            overateLabel.text = "I ate the right amount"
        }
        
        if let imageData = selectedMeal?.image {
            
            mealPageImageLabel.image = UIImage(data: imageData)
            
        }
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
