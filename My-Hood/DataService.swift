//
//  DataService.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/19.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import Foundation
import UIKit

class DataSource {
    
    static let instance = DataSource()
    
    let  KEY_POSTS = "posts"
    
    private var _loadedposts = [Post]()
    
    var loadedPosts: [Post] {
        return _loadedposts
    }
    
    func loadPosts() {
        
       if  let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
        
        if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
            
            _loadedposts = postArray
            
        }
            
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postLoaded", object: nil))
        
    }
    
    
    func savePosts() {
        
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedposts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    func saveImageandCreatePath(image: UIImage) -> String {
        
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        
        return imgPath
        
    }
    
    func imageForPath(path: String) -> UIImage? {
        
        let fullPath = documentsPathForFileName(path)
        
        let image = UIImage(named: fullPath)
        
        return image
        
        
    }
    
    func addPost(post: Post){
        
        _loadedposts.append(post)
        
        savePosts()
        loadPosts()
        
    }
    
    func documentsPathForFileName(name: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        
        return fullPath.stringByAppendingPathComponent(name)
        
    }
    
}