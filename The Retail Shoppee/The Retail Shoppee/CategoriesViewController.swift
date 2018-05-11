//
//  CategoriesViewController.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 08/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//

import UIKit
//import CategoryCollectionViewCell

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arr_Categories:[String] = ["Grocery", "Personal Care", "Detergents", "Pharmacy", "Fruit Basket"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arr_Categories.count+1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath as IndexPath) as! CategoryCollectionViewCell
        
        if(indexPath.row == self.arr_Categories.count){
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.lbl_CategoryName.text = "+"
            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        }
        else{
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.lbl_CategoryName.text = self.arr_Categories[indexPath.row]
            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        }
        
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if(self.arr_Categories.count > 0){
            if(indexPath.row == self.arr_Categories.count){
                self .getCategoryName()
            }
            else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "ProductsViewController")
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
        else{
            self .getCategoryName()
        }
    
    }
    
    func getCategoryName() {
        
        let alertController = UIAlertController(title: "", message: "Please add a category name:", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            
            let str_CategoryName = alertController.textFields![0] as UITextField
            
            if str_CategoryName.text != ""{
                
                self.arr_Categories.append(str_CategoryName.text!)
                
                self.collectionView .reloadData()
                
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "First Name"
            textField.textAlignment = .center
        })
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
