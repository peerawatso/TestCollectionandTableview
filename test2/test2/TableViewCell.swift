//
//  TableVIewCell.swift
//  test2
//
//  Created by DSolution Macbook on 9/11/2563 BE.
//
import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
}

extension TableViewCell {

    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {

        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }

    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
