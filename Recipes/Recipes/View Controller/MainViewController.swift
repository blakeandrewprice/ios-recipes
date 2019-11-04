//
//  MainViewController.swift
//  Recipes
//
//  Created by Blake Andrew Price on 10/31/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchRecipes { (recipeArray, error) in
            if error != nil {
                NSLog(error.debugDescription)
                return
            } else {
                return self.allRecipes = recipeArray!
            }
        }
    }
    //MARK: - Outlet
    @IBOutlet weak var mainViewTextField: UITextField!
    
    //MARK: - Action
    @IBAction func mainViewTextFieldAction(_ sender: Any) {
        mainViewTextField.resignFirstResponder()
        filterRecipes()
    }
    
    let networkClient = RecipesNetworkClient()
    
    //MARK: - Properties
    var allRecipes: [Recipe] = [] {
        didSet{
            filterRecipes()
        }
    }
    var recipesTableViewController: RecipesTableViewController? {
        didSet{
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet{
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedTableViewSegue" {
            recipesTableViewController = segue.destination as? RecipesTableViewController
        }
    }
    
    //MARK: - Functions
    func filterRecipes() {
        let search = mainViewTextField.text ?? ""
        if search == "" {
            filteredRecipes = allRecipes
        } else {
            filteredRecipes = allRecipes.filter { (recipe) -> Bool in
                return recipe.name.contains(search) || recipe.instructions.contains(search)
            }
        }
    }
}
    

