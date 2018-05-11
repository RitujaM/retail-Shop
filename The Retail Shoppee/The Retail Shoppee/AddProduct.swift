//
//  FirstPageViewController.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 07/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var btn_AddCategory: UIButton!
    @IBOutlet weak var btn_AddProduct: UIButton!
    var arr_Products: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr_Products.count;
    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
//        
//        cell.textLabel?.text = animals[indexPath.row]
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("You tapped cell number \(indexPath.row).")
//    }
    
    
    
    @IBAction func btn_AddCategoryEvent(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondPageViewController")
        self.navigationController?.pushViewController(controller, animated:true)
    }
    
    
    @IBAction func btn_ProductEvent(_ sender: Any) {
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondPageViewController")
        self.navigationController?.pushViewController(controller, animated:true)
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
