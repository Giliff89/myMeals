//
//  AddMealViewController.swift
//  My Meals
//
//  Created by gina iliff on 8/29/17.
//  Copyright © 2017 gina iliff. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var mealDescriptionText: UITextField!
    @IBOutlet weak var healthySwitch: UISwitch!
    @IBOutlet weak var glutenSwitch: UISwitch!
    @IBOutlet weak var overeatSwitch: UISwitch!
    @IBOutlet weak var mealImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var previousVC = MealTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        self.mealDescriptionText.delegate = self
    }
    
    // Hide keyboard when user touches outside text box
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Can also hide keyboard by having user press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealDescriptionText.resignFirstResponder()
        return true
    }
 

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func photoAlbumTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            mealImage.image = chosenImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addMealTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let meal = Meal(entity: Meal.entity(), insertInto: context)
            
            meal.mealDescription = mealDescriptionText.text
            meal.glutenFree = glutenSwitch.isOn
            meal.healthy = healthySwitch.isOn
            meal.overeat = overeatSwitch.isOn
            
            if let image = mealImage.image {
                if let imageData = UIImagePNGRepresentation(image) {
                    meal.image = imageData
                }
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
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
