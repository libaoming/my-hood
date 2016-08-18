//
//  AddPostVC.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var postTiltle: UITextField!
    @IBOutlet weak var postDesc: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postImg.layer.cornerRadius = postImg.frame.size.width / 2
        self.postImg.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPiePressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
    }
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func PostBtnPressed(sender: AnyObject) {
    }

   
}
