//
//  GroupCollectionViewCell.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import UIKit
import SDWebImage

class GroupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCategory: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func setCatalogItem(item: CatalogItem) {
        self.imageViewCategory.sd_setImage(with: URL(string: item.image!), completed: nil)
    }
    
}
