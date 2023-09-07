//
//  TableViewController.swift
//  MemeMe
//
//  Created by  ashwaq marzouq on 13/08/1444 AH.
//

import Foundation
import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    
    
    @IBOutlet weak var tableView: UITableView!
    var memes: [MemeMe]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
         navigationItem.backBarButtonItem = UIBarButtonItem(title: "SentMemes", style: .plain, target: nil, action: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 124
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView!.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let currentMeme: MemeMe = memes[indexPath.row]
       cell.imageView?.image = currentMeme.memeImage
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let destination = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        destination.passedImage.image = cell.imageView?.image
        navigationController?.pushViewController(destination, animated: true)
    }
    
 
}
