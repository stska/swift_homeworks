//
//  TableViewController.swift
//  vk
//
//  Created by user155176 on 10/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.tabBarController?.selectedIndex = 1
        
        
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
  //  let picOne = UIImage(named: "1")
    //let picTwo = UIImage(named: "2")
   // let picThree = UIImage(named: "3")
     let usersAva: [UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!, UIImage(named: "5")!,  UIImage(named:"6")!]
    
    let contacts:[String] =
        ["Stas",
        "Boris Britva",
        "Tim Cook",
         "Vladimir Putin"]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! FriendsTableCell
        
      
        // Configure the cell...
        cell.uiLabelFriends.text = contacts[indexPath.row]
        cell.uiImagaFriends.image = self.resizeImage(image: usersAva[indexPath.row], targetSize: CGSize.init(width: 40.0, height: 40.0))
        
       cell.uiImagaFriends.layer.cornerRadius = cell.uiImagaFriends.frame.size.width / 2
        cell.uiImagaFriends.clipsToBounds = true
        cell.uiImagaFriends.layer.borderColor = UIColor.red.cgColor
        cell.uiImagaFriends.layer.masksToBounds = true
 
        cell.uiImagaFriends.layer.shadowColor = UIColor.black.cgColor
        cell.uiImagaFriends.layer.shadowOpacity = 0.5
        cell.uiImagaFriends.layer.shadowRadius = 9
        cell.uiImagaFriends.layer.shadowOffset = CGSize.zero
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
      
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Hellooooooooooooooooo")
         self.performSegue(withIdentifier: "goToCollection", sender: nil)
        
    }
    @IBAction func unwindToVC(segue:UIStoryboardSegue) { }
    
    
    //  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Perform Segue

   // }
   
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
     @IBOutlet weak var tabCell: UIView!
     return 0
    } */

   
    
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
// segue.destination.addChild()
        // Pass the selected object to the new view controller.
    }
    */
    
    
  
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollectionView" {
          
        
    }
     *//////////////////////////////////////////////////
    
    

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
