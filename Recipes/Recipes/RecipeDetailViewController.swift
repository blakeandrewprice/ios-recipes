//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Blake Andrew Price on 10/31/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBOutlet weak var recipeDetailLabel: UILabel!
    @IBOutlet weak var recipeDetailTextView: UITextView!
    
    var recipe: Recipe? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        if isViewLoaded {
            if let unwrappedRecipe = recipe {
                recipeDetailLabel.text = unwrappedRecipe.name
                recipeDetailTextView.text = unwrappedRecipe.instructions
            }
        }
    }
}
