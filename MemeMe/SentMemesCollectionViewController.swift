//
//  File.swift
//  MemeMe
//
//  Created by  ashwaq marzouq on 08/08/1444 AH.
//

import Foundation
import UIKit

class SentMemesCollectionViewController : UICollectionViewController {
    
    
    
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    var memes: [MemeMe]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "SentMemes", style: .plain, target: nil, action: nil)
        
        let space:CGFloat = 3.0
         let dimension = (view.frame.size.width - (2 * space)) / 3.0

         flowLayout.minimumInteritemSpacing = space
         flowLayout.minimumLineSpacing = space
         flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView!.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell

            // Set the name and image
            let currentMeme:  MemeMe = memes[indexPath.row]
            cell.memeImag.image = currentMeme.memeImage
         

            return cell
        }
      
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
            let cell = collectionView.cellForItem(at: indexPath)as! MemeCollectionViewCell
            let destination = storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
            destination.passedImage.image = cell.memeImag.image
            navigationController?.pushViewController(destination, animated: true)

        }
    
    
}

