//
//  MyGroupsTableViewController.swift
//  vk
//
//  Created by user155176 on 14/08/2019.
//  Copyright © 2019 user155176. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    let groupsList: [String] = ["Programming","History","Memes","9GAG","LADbible","Reddit"]
    
    let groupAvatars: [UIImage] = [UIImage(named: "11")!,UIImage(named: "22")!,UIImage(named: "33")!,UIImage(named: "11")!, UIImage(named: "22")!,  UIImage(named:"33")!]
    
    // MARK: - Table view data source
    //---------------------------------------------  Resize intaking image
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
    ////---------------------------------------
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupsList.count
    }

    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupIdentity", for: indexPath) as! MyGroupTableViewCell
    
        //cell.textLabel?.text = groupsList[indexPath.row]
       cell.labelGroup?.text = groupsList[indexPath.row]
       // cell.uiGroupImage.image = self.resizeImage(image: UIImage(named: "2")!, targetSize: CGSize.init(width: 40.0, height: 40.0))
        cell.uiGroupImage.image = self.resizeImage(image: groupAvatars[indexPath.row], targetSize: CGSize.init(width: 40.0, height: 40.0))
        
        cell.uiGroupImage.layer.cornerRadius = cell.uiGroupImage.frame.size.width / 2
        cell.uiGroupImage.clipsToBounds = true
        cell.uiGroupImage.layer.borderColor = UIColor.red.cgColor
        cell.uiGroupImage.layer.masksToBounds = true
         

        cell.uiGroupImage.layer.shadowColor = UIColor.black.cgColor
        cell.uiGroupImage.layer.shadowOpacity = 0.5
        cell.uiGroupImage.layer.shadowRadius = 9
        cell.uiGroupImage.layer.shadowOffset = CGSize.zero
        
        
        return cell
        
    }
    

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
