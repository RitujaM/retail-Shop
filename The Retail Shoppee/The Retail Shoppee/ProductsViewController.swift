//
//  ProductsViewController.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 08/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//

import UIKit
import CoreData


class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dict_Products = ["Product1": "12.0", "Product2" : "13.0", "Product3" : "14.0", "Product4" : "15.0"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dict_Products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath as IndexPath) as! ProductsTableViewCell
        cell.lbl_ProductName.text = Array(self.dict_Products.keys)[indexPath.row]
        cell.lbl_Price.text = Array(self.dict_Products.values)[indexPath.row];
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "", message: "Add To Cart", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            alert -> Void in
        
            if (Array(self.dict_Products).count > indexPath.row) {
                
                let strKey = Array(self.dict_Products.keys)[indexPath.row]
                let strvalue = Array(self.dict_Products.values)[indexPath.row]
                
                // save to database
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "CartProducts", in: context)
                let newProduct = NSManagedObject(entity: entity!, insertInto: context)
                
                newProduct.setValue(strvalue, forKey: "productName")
                newProduct.setValue(strKey, forKey: "productPrice")
                
                do {
                    try context.save()
                } catch {
                    print("Failed saving")
                }
                
                alertController .dismiss(animated: true, completion: nil)
                
            }
            else
            {
                let errorAlert = UIAlertController(title: "Error", message: "Please input both a product and price", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                    alert -> Void in
                    self.present(alertController, animated: true, completion: nil)
                }))
                self.present(errorAlert, animated: true, completion: nil)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler:nil))
        
        self.present(alertController, animated: true, completion: nil)
    }


    @IBAction func btn_AddProductEvent(_ sender: Any) {
        
        let alertController = UIAlertController(title: "", message: "Please add a product name and Price:", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            
            let str_ProductName = alertController.textFields![0] as UITextField
            let str_Price = alertController.textFields![1] as UITextField
            
            
            if (str_ProductName.text != "") && (str_Price.text != "") {
                
                self.dict_Products.updateValue(str_Price.text!, forKey: str_ProductName.text!)
                
                self.tableView .reloadData()
                
            }
            else
            {
                let errorAlert = UIAlertController(title: "Error", message: "Please input both a product and price", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {
                    alert -> Void in
                    self.present(alertController, animated: true, completion: nil)
                }))
                self.present(errorAlert, animated: true, completion: nil)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
        
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Product Name"
            textField.textAlignment = .center
        })
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Price"
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
