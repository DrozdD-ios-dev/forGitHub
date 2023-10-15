//
//  ViewOne.swift
//  GalleryOne.One
//
//  Created by Дрозд Денис on 13.10.2023.
//

import UIKit

class ViewOne: UIViewController {
    @IBOutlet weak var collectionViewOne: UICollectionView!
    var images = [UIImage]() // создали пустой массив картинок
    let countCells = 2
    let offset : CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOne.dataSource = self
        collectionViewOne.delegate = self
        for i in 1...10 { // перебираем картинки от 1 до 10
            let image = UIImage(named: "M\(i)")! // по названию
            images.append(image) // и вставляем в массив images
        }
    }

}
extension ViewOne: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection/* numberOfItemsInSection - кол-во картинок*/ section: Int) -> Int {
        return images.count // возвращаем кол-во картинок
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "cellImageOne", for: indexPath) as!
        imageCollectionViewCellOne
        let image = images[indexPath.item]
        cell.photoViewOne.image = image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        print(widthCell)
        print(heightCell)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))

    }
    

}
