//
//  PolishTableViewController.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 10/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import CoreData

class PolishTableViewController: UITableViewController {
    
    
    var polishes = [Polish]()
    var brands = [Brand]()
   
    var context:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        
        context = del.persistentContainer.viewContext
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchPolishes()
//        fetchBrands()
    }
    
    func fetchPolishes(){
        let request: NSFetchRequest<Polish> = Polish.fetchRequest()
        
        let sort = NSSortDescriptor(key: "polishName", ascending: true)
        request.sortDescriptors = [sort]
        
        let asyncRequest = NSAsynchronousFetchRequest<Polish>(fetchRequest: request) { (result) in
            self.polishes = result.finalResult ?? []
            self.tableView.reloadData()
        }
        
        
        do{
            try context.execute(asyncRequest)
        }catch let error {
            print(error)
        }
        
        
    }
    
//    func fetchBrands(){
//        let request: NSFetchRequest<Brand> = Brand.fetchRequest()
//        
//        let sort = NSSortDescriptor(key: "brandName", ascending: true)
//        
//        request.sortDescriptors = [sort]
//        
//        let asyncRequest = NSAsynchronousFetchResult<Brand>(fetchRequest: request) { (result) in
//            self.brands = result.finalResult ?? []
//            self.tableView.reloadData()
//        }
//        
//        do{
//            try context.execute(asyncRequest)
//        }catch let error {
//            print(error)
//        }
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return polishes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "polishCell", for: indexPath)

        let polish = polishes[indexPath.row]
        
        let brandNameLabel = cell.viewWithTag(1) as! UILabel
        brandNameLabel.text = polish.brand?.brandName
        
        let polishNameLabel = cell.viewWithTag(2) as! UILabel
        polishNameLabel.text = polish.polishName
        
        let polishColorLabel = cell.viewWithTag(3) as! UILabel
        polishColorLabel.text = polish.color
        
        let polishRefLabel = cell.viewWithTag(4) as!UILabel
        polishRefLabel.text = polish.reference
     
        
        
        
        //   cell.textLabel?.text = polish.polishName
       // cell.detailTextLabel?.text = "brand" //polish.brand?.brandName
       // cell.detailTextLabel?.text = polish.color
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let polish = polishes[indexPath.row]
//        
//        
//        do{
//            try context.save()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//            tableView.deselectRow(at: indexPath, animated: true)
//        }catch let error{
//            print(error)
//        }
//    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let polish = polishes.remove(at: indexPath.row)
            context.delete(polish)
            
            do {
                try context.save()
            } catch let error {
                print(error)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
