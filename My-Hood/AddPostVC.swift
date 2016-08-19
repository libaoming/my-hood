//
//  AddPostVC.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postTiltle: UITextField!
    @IBOutlet weak var postDesc: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postImg.layer.cornerRadius = postImg.frame.size.width / 2
        self.postImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPiePressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func PostBtnPressed(sender: AnyObject) {
        
        if let title = postTiltle.text, let  desc = postDesc.text, let img = postImg.image {
            
            let imgPath = DataSource.instance.saveImageandCreatePath(img)
            
            var post = Post(imagePath: imgPath, title: title, postDesc: desc)
            
            DataSource.instance.addPost(post)
            
            
            
        }
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }

   
}
