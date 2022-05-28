//
//  MovieCollectionViewCell.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "movieCollectionViewCellIdentifier"
    private var viewmodel: MovieViewModel?
    
    @IBOutlet private weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 5
            imageView.layer.masksToBounds = true
        }
    }
    
    func configure(with viewmodel: MovieViewModel) {
        self.viewmodel = viewmodel
        
        viewmodel.getImage { [weak self] image in
            self?.imageView.image = image
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewmodel?.imageWorkItem?.cancel()
        viewmodel?.imageWorkItem = nil
        viewmodel = nil
    }

}
