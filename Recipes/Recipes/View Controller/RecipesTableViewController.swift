//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Blake Andrew Price on 10/31/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Properties
    var recipes: [Recipe] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        
        return cell
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CellDetailViewSegue" {
            if let recipeDetailVC = segue.destination as? RecipeDetailViewController,
                let selectedCell = sender as? UITableViewCell {
                let index = tableView.indexPath(for: selectedCell)
                let recipe = recipes[index!.row]
                recipeDetailVC.recipe = recipe
            }
        }
    }
}
