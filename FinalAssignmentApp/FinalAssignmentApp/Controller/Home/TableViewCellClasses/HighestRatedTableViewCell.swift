//
//  HighestRatedTableViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit
import SDWebImage

class HighestRatedTableViewCell: UITableViewCell {
    static let identifier = "HighestRatedTableViewCell"
    fileprivate let placeholderImage = UIImage(named: "someImage")
    var highestRatedMovies = [MainMovieModel]()
    fileprivate let highestRatedImageBaseURL = URL(string: "https://image.tmdb.org/t/p/w154")

    @IBOutlet weak var highestRatedCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        highestRatedCollectionView.dataSource = self
        highestRatedCollectionView.delegate = self
        
        highestRatedCollectionView.register(HighestRatedCollectionViewCell.nib(), forCellWithReuseIdentifier: HighestRatedCollectionViewCell.identifer)
        
        NetworkingClient.shared.getHighestRatedMovies { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let highestRatedMovieData):
                self.highestRatedMovies = highestRatedMovieData
                DispatchQueue.main.async {
                    self.highestRatedCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching highestRatedMovies: \(error)")
            }
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
}

extension HighestRatedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("SomethingJustLikeThis: \(highestRatedMovies)")
        return highestRatedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighestRatedCollectionViewCell.identifer, for: indexPath) as! HighestRatedCollectionViewCell
        let highestRatedImagePath = highestRatedMovies[indexPath.item].imagePath
        let highestRatedImageURL = highestRatedImageBaseURL?.appendingPathComponent(highestRatedImagePath)
        cell.highestRatedImageView.sd_setImage(with: highestRatedImageURL, placeholderImage: placeholderImage, options: SDWebImageOptions.highPriority) { (downloadedHighestRatedImage, downloadException, cacheType, highestRatedImageDownloadURL) in
            if let downloadException = downloadException {
                print("Error downloading highestRated image: \(downloadException)")
            } else {
                print("Successfully downloaded highestRated image: \(String(describing: highestRatedImageDownloadURL?.absoluteString))")
            }

        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 154, height: 240)
    }
    
}


