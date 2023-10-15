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
    var photoData: PhotoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollection()
        getPhoto()
    }
    
    
    func setupCollection() {
        collectionViewOne.dataSource = self
        collectionViewOne.delegate = self
        for i in 1...10 { // перебираем картинки от 1 до 10
            let image = UIImage(named: "M\(i)")! // по названию
            images.append(image) // и вставляем в массив images
        }
    }
    
    func getPhoto() {
        let urlString = "https://gallery.prod1.webant.ru/api/photos?new=true&popular=false&page=1&limit=100"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PhotoModel.self, from: data)
                self.photoData = response
                DispatchQueue.main.async {
                    self.collectionViewOne.reloadData()
                }
            } catch {
                
            }
            
            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            
        }.resume()
    }
}


// MARK: - collection

extension ViewOne: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection/* numberOfItemsInSection - кол-во картинок*/ section: Int) -> Int {
        return photoData?.data.count ?? 0 // возвращаем кол-во картинок
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewOne.dequeueReusableCell(withReuseIdentifier: "cellImageOne", for: indexPath) as!
        imageCollectionViewCellOne
//        let image = images[indexPath.item]
//        cell.photoViewOne.image = image
        let url = "https://gallery.prod1.webant.ru/media/\(photoData?.data[indexPath.row].image.name ?? "")"
        
            cell.getPhoto(url: url)
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))

    }
    //-
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(photoData?.data[indexPath.row].image.name)
    }
    

}
