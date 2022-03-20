//
//  SmartCollectionViewCell.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import UIKit

class SmartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCategory: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func setCatalogItem(item: CatalogItem) {
        self.labelName.text = item.name
        self.imageViewCategory.sd_setImage(with: URL(string: item.image!), completed: nil)
    }
}
