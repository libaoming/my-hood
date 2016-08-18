//
//  Post.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _postDesc: String
    
    var title: String {
        return _title
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(imagePath: String, title: String, postDesc: String){
        
        self._imagePath = imagePath
        self._title = title
        self._postDesc = postDesc
    }
}