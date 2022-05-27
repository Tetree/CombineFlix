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
                viewmodel.fetchMovies(reset: true)
                setSubscriptions(for: viewmodel)
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
    
    private var subscription:AnyCancellable?
    
    private func setSubscriptions(for viewmodel: SectionViewModel) {
        subscription = viewmodel
            .moviePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        selectionStyle = .none
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewmodel = nil
        subscription?.cancel()
        subscription = nil
    }
    
    func configure(with viewmodel: SectionViewModel) {
        self.viewmodel = viewmodel
        sectionLabel.text = viewmodel.sectionName
    }
    
}

extension SectionTableViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel?.numberOfMovies ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath) as! MovieCollectionViewCell

        if let viewmodel = viewmodel {
            cell.configure(with: viewmodel.getViewmodel(for: indexPath.item))
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height * 0.95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
}
