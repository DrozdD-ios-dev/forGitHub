//
//  imageCollectionViewCellOne.swift
//  GalleryOne.One
//
//  Created by Дрозд Денис on 13.10.2023.
//

import UIKit
import Kingfisher

class imageCollectionViewCellOne: UICollectionViewCell {
    @IBOutlet weak var photoViewOne: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getPhoto(url: String){
        let url = URL(string: url)
        print(url)
        photoViewOne.kf.setImage(with: url)
    }
    
//    62dfda81b0253985982739.jpeg
//gallery.prod1.webant.ru/media/file_name62dfda81b0253985982739.jpeg
}
