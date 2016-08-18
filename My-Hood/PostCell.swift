//
//  PostCell.swift
//  My-Hood
//
//  Created by 李宝明 on 16/8/18.
//  Copyright © 2016年 李宝明. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.postImg.layer.cornerRadius = postImg.frame.size.width / 2
        self.postImg.clipsToBounds = true
    }

    func configure(post: Post){
        self.titleLbl.text = post.title
        self.descLbl.text = post.postDesc
    }
    

}
