//
//  ViewController.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        var post1 = Post(imagePath: "", title: "zoe 1", postDesc: " i am zoe 1")
        var post2 = Post(imagePath: "", title: "zoe 2", postDesc: " i am zoe 2")
        var post3 = Post(imagePath: "", title: "zoe 3", postDesc: " i am zoe 3")
        
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        
        tableview.reloadData()


       
    }

  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            cell.configure(post)
            
            return cell
        }else {
            
            let cell = PostCell()
            cell.configure(post)
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

}

