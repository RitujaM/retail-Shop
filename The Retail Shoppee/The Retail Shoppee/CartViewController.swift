//
//  CartViewController.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 10/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//

import UIKit
import CoreData

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var dict_Cart = [String : String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        //fetching from data base
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartProducts")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                self.dict_Cart.updateValue(data.value(forKey: "productName") as! String, forKey: data.value(forKey: "productPrice") as! String)
                
                self.tableView.reloadData()
                
            }
            
        } catch {
            
            print("Failed")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.dict_Cart.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath as IndexPath) as! ProductsTableViewCell
        cell.lbl_ProductName.text = Array(self.dict_Cart.keys)[indexPath.row]
        cell.lbl_Price.text = Array(self.dict_Cart.values)[indexPath.row];
        
        return cell
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
