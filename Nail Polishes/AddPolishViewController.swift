//
//  AddPolishViewController.swift
//  Nail Polishes
//
//  Created by Tywin Lannister on 10/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit
import CoreData

class AddPolishViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var brandField: UITextField!
    
    @IBOutlet weak var colorField: UITextField!
    
    @IBOutlet weak var refField: UITextField!
    
    @IBOutlet weak var imagePicked: UIImageView!
    
    
    var context:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        
        context = del.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
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

    @IBAction func openPhotoLibraryButton(_ sender: UIButton) {
               
        
    }
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let polish  = NSEntityDescription.insertNewObject(forEntityName : "Polish", into: context) as! Polish
        
        let brand = NSEntityDescription.insertNewObject(forEntityName: "Brand", into: context) as! Brand
        
        
        
        polish.polishName = titleField.text
        brand.brandName = brandField.text
        polish.color = colorField.text
        polish.reference = refField.text
        
        do{
            try context.save()
            dismiss(animated: true, completion: nil)
        }
        catch let error {
            print(error)
        }
        
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
