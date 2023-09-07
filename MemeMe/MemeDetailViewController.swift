//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by  ashwaq marzouq on 13/08/1444 AH.
//

import Foundation

import UIKit

class MemeDetailViewController: UIViewController {

    var passedImage = UIImageView()
@IBOutlet weak var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageDetail.image = passedImage.image
    }
    

}
