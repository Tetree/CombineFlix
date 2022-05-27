//
//  MovieCollectionViewCell.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "movieCollectionViewCellIdentifier"
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 5
            imageView.layer.masksToBounds = true
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewmodel: MovieViewModel) {
        
    }

}
