//
//  BestTableViewCell.swift
//  FinalAssignmentApp
//
//  Created by Yasharth Saxena on 28/05/20.
//  Copyright © 2020 Yasharth Saxena. All rights reserved.
//

import UIKit
import SDWebImage

class BestTableViewCell: UITableViewCell {
    static let identifier = "BestTableViewCell"
    var bestMovies = [MainMovieModel]()
    fileprivate let placeholderImage = UIImage(named: "someImage")
    fileprivate let bestImageBaseURL = URL(string: "https://image.tmdb.org/t/p/w154")
    
    @IBOutlet weak var bestCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bestCollectionView.dataSource = self
        bestCollectionView.delegate = self
        
        bestCollectionView.register(BestCollectionViewCell.nib(), forCellWithReuseIdentifier: BestCollectionViewCell.identifier)
        
        NetworkingClient.shared.getBestMovies { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let bestMovieData):
                self.bestMovies = bestMovieData
                DispatchQueue.main.async {
                    self.bestCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching best movies: \(error)")
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
}

extension BestTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestCollectionViewCell.identifier, for: indexPath) as! BestCollectionViewCell
        let bestImagePath = bestMovies[indexPath.item].imagePath
        let bestImageURL = bestImageBaseURL?.appendingPathComponent(bestImagePath)
        
        cell.bestImageView.sd_setImage(with: bestImageURL, placeholderImage: placeholderImage, options: SDWebImageOptions.highPriority) { (downloadedBestImage, downloadException, cacheType, bestImageDownloadURL) in
            if let downloadException = downloadException {
                print("Error downloading best image: \(downloadException)")
            } else {
                print("Successfully downloaded best image: \(String(describing: bestImageDownloadURL?.absoluteString))")
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 154, height: 240)
    }
}
