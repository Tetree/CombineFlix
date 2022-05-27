//
//  SectionTableViewCell.swift
//  Combineflix
//
//  Created by Nuno Mota on 26/05/2022.
//

import UIKit
import Combine

class SectionTableViewCell: UITableViewCell {
    
    private var viewmodel:SectionViewModel? {
        didSet {
            if let viewmodel = viewmodel {
                viewmodel.load()
            }
        }
    }
    
    static let cellIdentifier = "sectionTableViewCellIdentifier"
    
    @IBOutlet private weak var sectionLabel: UILabel!
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.cellIdentifier)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        selectionStyle = .none
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewmodel = nil
    }
    
    func configure(with viewmodel: SectionViewModel) {
        self.viewmodel = viewmodel
    }
    
}

extension SectionTableViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel?.numberOfMovies ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath) as! MovieCollectionViewCell

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height * 0.95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
}
